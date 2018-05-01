<template>
    <div id="video">
        <!--video element to show standard videocalls, hidden when recording component is shown-->
        <video v-if="!showRecordingInterface" id="call_video" poster="/img/videocall/video-placeholder.jpg">
            <source :src="currentVideo.video_url" type="video/mp4">
        </video>

        <video v-if="!showRecordingInterface" id="personal_video" poster="/img/videocall/video-placeholder.jpg" autoplay>
            <source src="/video/record.mp4" type="video/mp4">
        </video>

        <canvas id="visualizer"></canvas>

        <!--video recording component, hidden until click on inactive character-->
        <video-message v-if="showRecordingInterface" :recording="recording" :clickedCharacter="clickedCharacter"></video-message>

        <div id="controlBar">

            <!--dropup module for contacts-->
            <div class="dropup">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i id="phonebook" class="material-icons">contacts</i>
                </a>
                <div id="contacts" class="dropdown-menu">
                    <div class="contact-inner dropdown-item"
                         v-for="person in characters"
                         :id="person.id"
                         @click="loadCallVideo(person.id)">
                        <img class="characterImage" :src="person.img_small">
                        <div class="characterInfo">
                            <span class="characterName">{{person.name}}</span><br>
                            <span class="characterPosition">{{person.role}}</span>
                        </div>
                        <span class="characterActive" v-if="activeContacts.includes(person.id)">
                            <i class="material-icons activeIcon">fiber_manual_record</i>
                        </span>
                    </div>
                </div>
            </div>

            <!--toolbar buttons-->
            <a href="#" v-if="showRecordingInterface" @click="startStopRecording">
                <i id="recording" class="material-icons">fiber_manual_record</i>
            </a>
            <a href="#" v-if="!showRecordingInterface" @click="changePhoneIcon">
                <i id="call" class="material-icons">{{this.callIconToggleStatus}}</i>
            </a>
            <a href="#" @click="changeMicIcon">
                <i id="mic" class="material-icons">mic</i>
            </a>

        </div>

        <!--show character questions-->
        <character-questions id="characterQuestions"
                             :questions="this.currentQuestions"
                             v-on:question="askQuestion">
        </character-questions>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import question from './question.vue'
    import videoMessage from './record_message.vue'
    import VideoMessage from "./record_message";

    export default {
        props: ['calls', 'characters', 'questions'],
        data: function () {
            return {
                videoEl: {},
                callIconToggleStatus: "call",
                currentQuestion: {},
                currentQuestions: [],
                currentVideo: {},
                showRecordingInterface: false,
                recording: false,
                clickedCharacter: 0,
            }
        },
        mounted() {
            this.startSelfVideo();
        },
        components: {
            VideoMessage,
            'character-questions': question,
            'video-message': videoMessage
        },
        watch: {
            currentVideo: function () {
                this.videoEl = document.querySelector('video');
                if(!this.showRecordingInterface) {
                    this.currentSrc = this.currentVideo.call_url;
                    this.videoEl.load();
                    this.callIconToggleStatus = "call";
                }
            },
            currentQuestion: function () {
                if(!this.showRecordingInterface) {
                    document.getElementById('call_video').currentTime = (parseInt(this.currentQuestion.start_time) + 0.51);
                    console.log(this.videoEl.currentTime);
                    document.getElementById('call_video').play()
                    this.callIconToggleStatus = "call_end";
                }
            },
            showRecordingInterface: function(){
                if(this.showRecordingInterface == false){
                    this.startSelfVideo();
                }
            }
        },
        computed: {
            activeContacts: function() {
                return this.calls.filter((character) => {
                    if(character.day === this.$store.state.user.current_day){
                        return character.character_id;
                    }
                }).map((character) => {
                    return character.character_id;
                })
            }
        },
        methods: {
            loadCallVideo: function (person_id) {
                this.clickedCharacter = person_id;

                //check if the contact clicked on is active
                let activeCall = this.calls.find((call) => {
                    if (call.character_id === person_id) {
                        return call;
                    }
                })
                if (activeCall) {
                    //if active, return the questions associated with them
                    this.showRecordingInterface = false;
                    this.currentQuestions = this.questions.filter((question) => {
                        if (question.call_id == activeCall.video_id) {
                            return question;
                        }
                    })
                    this.currentVideo = activeCall;
                } else {
                    //if not active, leave a message
                    this.leaveMessage();
                }
            },
            leaveMessage: function () {
                this.showRecordingInterface = true;
                this.currentQuestions = [];
                this.currentQuestion = {};
                this.currentVideo = {};
            },
            changePhoneIcon: function () {
                if (this.callIconToggleStatus === "call") {
                    this.videoEl.play();
                    this.callIconToggleStatus = "call_end";
                } else {
                    this.videoEl.pause();
                    this.callIconToggleStatus = "call";
                }
            },
            changeMicIcon: function () {
                if (document.getElementById('mic').innerText === "mic") {
                    document.getElementById('mic').innerText = "mic_off";
                } else {
                    document.getElementById('mic').innerText = "mic";
                }
            },
            startStopRecording: function () {
                this.recording = !this.recording;
            },
            askQuestion: function (question) {
                this.currentQuestion = question;
            },
            startSelfVideo: function () {
                //set that we want both audio and video
                const constraints = {
                    audio: {
                        echoCancellation: true,
                        noiseSuppression: true
                    },
                    video: true
                };

                //this.startAudio();
                //start recording
                navigator.mediaDevices.getUserMedia(constraints)
                    .then(this.handleSuccess.bind(this))
                    .catch(this.handleFailure);
            },
            handleFailure: function (error) {
                //if they don't have browser support, try a lower compatibility function or fail
                console.error('Reeeejected!', error);
            },
            handleSuccess: function (stream) {
                const video = document.getElementById('personal_video');

                const recordedChunks = [];
                let audioStream = stream.getTracks()[0];
                let videoStream = stream.getTracks()[1];

                //initialize and display recording stream
                const mediaRecorder = new MediaRecorder(stream);
                video.srcObject = stream;

                //start recording when video is loaded
                video.addEventListener('loadeddata', function () {
                    mediaRecorder.start(3000);
                    video.muted = 'true';
                })

                //set local variable to set correct scope
                let appScope = this;
                this.startAudio(stream);
                //save data as it becomes available. Stop recording if stop button has been triggered
                mediaRecorder.addEventListener('dataavailable', function (e) {
                    if (e.data.size > 0) {
                        recordedChunks.push(e.data);
                    }
                    /*if (appScope.recording == false) {
                        mediaRecorder.stop();
                    }*/
                });

                //when recording stops, save the video object and stop displaying video stream
                mediaRecorder.addEventListener('stop', function () {
                    audioStream.stop();
                    videoStream.stop();


                })
            },
            startAudio: function(){
                var appScope = this;
                navigator.mediaDevices.getUserMedia({ audio: true }).then(stream => {
                    // store streaming data chunks in array
                    const chunks = [];

                    var audioCtx = new (window.AudioContext || window.webkitAudioContext)();
                    var analyser = audioCtx.createAnalyser();
                    analyser.minDecibels = -90;
                    analyser.maxDecibels = -10;
                    analyser.smoothingTimeConstant = 0.85;
                    analyser.fftSize = 256;

                    var distortion = audioCtx.createWaveShaper();
                    var gainNode = audioCtx.createGain();
                    var biquadFilter = audioCtx.createBiquadFilter();
                    var convolver = audioCtx.createConvolver();


                    let canvasCtx = document.getElementById('visualizer');
                    canvasCtx = canvasCtx.getContext("2d");

                    // create media recorder instance to initialize recording
                    const recorder = new MediaRecorder(stream);

                    let source = audioCtx.createMediaStreamSource(stream);
                    let WIDTH = 400;
                    let HEIGHT = 150;
                    source.connect(analyser);

                    // function to be called when data is received
                    recorder.ondataavailable = e => {
                        // add stream data to chunks
                        chunks.push(e.data);

                        let bufferLength = analyser.frequencyBinCount;
                        let dataArray = new Uint8Array(bufferLength);
                        analyser.getByteFrequencyData(dataArray)

                        canvasCtx.clearRect(0, 0, WIDTH, HEIGHT);
                        appScope.draw(analyser, bufferLength, canvasCtx, WIDTH, HEIGHT)


                    };
                    // start recording with 1 second time between receiving 'ondataavailable' events
                    recorder.start(300);

                }).catch(console.error);
            },
            draw: function(analyser, bufferLength, canvasCtx, WIDTH, HEIGHT){
                canvasCtx.clearRect(0, 0, WIDTH, HEIGHT);
                let drawVisual = requestAnimationFrame(this.draw);

                let dataArray = new Uint8Array(bufferLength);
                analyser.getByteFrequencyData(dataArray);

                canvasCtx.fillStyle = '#f5f8fa';
                canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);

                var barWidth = (WIDTH / bufferLength) * 2.5;
                var barHeight;
                var x = 0;

                for(var i = 0; i < bufferLength; i++) {
                    barHeight = dataArray[i]/2;

                    canvasCtx.fillStyle = 'rgb(' + (barHeight+50) + ',50,50)';
                    canvasCtx.fillRect(x,HEIGHT-barHeight/2,barWidth,barHeight);

                    x += barWidth + 1;
                }
            }
        }
    }

</script>

<style scoped lang="scss">
    @import "../../../sass/_variables.scss";

    a {
        color: white;
    }
    #controlBar{
        display: flex;
        justify-content: space-between;
        padding: 0px 10px;
        background-color: $sim-heading;
        height: 40px;
        font-size: 25px
    }
    #recording{
        color: red;
    }
    #call_video{
        height: 40rem;
        width: 100%;
    }
    .contact-inner{
        padding: 10px;
        display: flex;
        flex-flow: row;
    }
    .contact-inner:nth-child(even) {
        border-top: solid 1px;
        border-bottom: solid 1px;
        border-color: #d9dcde;
    }
    .characterInfo{
        margin-left: 2rem;
        width: 58%;
    }
    .characterActive{
        color: #3c763d;
        align-self:center;
    }
    .activeIcon{
        font-size: 14px;
    }
    #characterQuestions{
        height: 20rem;
        overflow-y: scroll;
        background-color: white;
        display: flex;
        flex-flow: wrap;
        justify-content: space-between;
    }
    .dropdown-menu{
        min-width: 220px;
    }
    #personal_video{
        height: 125px;
        width: 150px;
    }

</style>