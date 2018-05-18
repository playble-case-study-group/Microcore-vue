<template>
    <div id="video">
        <div class="video-container">
            <!--video element to show standard videocalls, hidden when recording component is shown-->
            <video v-if="!showRecordingInterface" id="call_video" poster="/img/videocall/video-placeholder.jpg">
                <source :src="currentVideo.video_url" type="video/mp4">
            </video>

            <video v-if="!showRecordingInterface" id="personal_video" poster="/img/videocall/video-placeholder.jpg" autoplay>
                <source src="/video/record.mp4" type="video/mp4">
            </video>
        </div>
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
                         :key="person.id"
                         @click="loadCallVideo(person.id)">
                        <img class="characterImage" :src="person.img_small">
                        <div class="characterInfo">
                            <span class="characterName">{{ person.name }}</span><br>
                            <span class="characterPosition">{{ person.role }}</span>
                        </div>
                        <span class="characterActive" v-if="activeContacts.includes(person.id)">
                            <i class="material-icons activeIcon">fiber_manual_record</i>
                        </span>
                    </div>
                </div>
            </div>

            <!--toolbar buttons-->
            <a href="#" v-if="showRecordingInterface || leaveResponse" @click="startStopRecording">
                <i id="recording" class="material-icons">fiber_manual_record</i>
            </a>
            <a href="#" v-if="!showRecordingInterface && !leaveResponse" @click="changePhoneIcon">
                <i id="call" class="material-icons">{{this.callIconToggleStatus}}</i>
            </a>
            <canvas id="visualizer"></canvas>

        </div>

        <!--show character questions-->
        <character-questions id="characterQuestions"
                             :countdown="this.countdownTime"
                             :warningTime="this.warningTime"
                             :questions="this.currentQuestions"
                             :disabledQuestions="this.disabledQuestions"
                             @question="askQuestion">
        </character-questions>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import question from './question.vue'
    import videoMessage from './record_message.vue'
    import VideoMessage from "./record_message";

    export default {
        props: {
            calls: Array,
            characters: Array,
            questions: Array,
            disabledQuestions: Array
        },
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
                leaveResponse: false,
                responded: false,
                countdownTime: 0,
                warningTime: 5
            }
        },
        mounted() {
            this.startSelfVideo();
        },
        components: {
            'character-questions': question,
            'video-message': videoMessage
        },
        watch: {
            currentVideo: function () {
                this.videoEl = document.querySelector('video');
                if(!this.showRecordingInterface) {
                    this.videoEl.load();
                    this.callIconToggleStatus = "call";
                }
            },
            currentQuestion: function () {
                if(!this.showRecordingInterface) {
                    document.getElementById('call_video').currentTime = (parseInt(this.currentQuestion.start_time) + 0.51);
                    document.getElementById('call_video').play()
                    this.callIconToggleStatus = "call_end";

                    let appScope = this;
                    document.getElementById('call_video').addEventListener("timeupdate", function () {
                          if (document.getElementById('call_video').currentTime >= appScope.currentQuestion.end_time) {
                              document.getElementById('call_video').pause();

                              if(appScope.currentQuestion.record_after){
                                  if(!appScope.responded) {
                                      appScope.leaveResponse = true;
                                  }
                              }
                        }
                    });
                }
            },
            showRecordingInterface: function(){
                if(this.showRecordingInterface == false){
                    this.startSelfVideo();
                }
            },
            leaveResponse: function(){
                let appScope = this;
                if(this.leaveResponse == true) {
                    appScope.answerQuestion();
                    appScope.countdownTime = appScope.currentQuestion.recording_duration;
                } else {
                    this.currentQuestion = this.currentQuestions.find(function(question){
                        if(question.question_id == appScope.currentQuestion.next_question){
                            return question;
                        }
                    })
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
            startStopRecording: function () {
                if(!this.leaveResponse) {
                    this.recording = !this.recording;
                }
            },
            askQuestion: function (question) {
                this.responded = false;
                this.currentQuestion = question;
            },

            //these functions handle all video objects and actions
            answerQuestion: function(){
                //set that we want both audio and video
                const constraints = {
                    video: true,
                    audio: true
                };

                //start recording
                navigator.mediaDevices.getUserMedia(constraints)
                    .then(this.handleMessage.bind(this))
                    .catch(this.handleFailure);
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
                console.error(error);
            },
            handleMessage: function (stream) {
                const video = document.getElementById('personal_video');

                const recordedChunks = [];
                let audioStream = stream.getTracks()[0];
                let videoStream = stream.getTracks()[1];

                //set local variable to set correct scope
                let appScope = this;

                //initialize and display recording stream
                const mediaRecorder = new MediaRecorder(stream);
                video.srcObject = stream;

                //how long you would like to warning countdown to be
                let warning = this.warningTime * 1000;
                console.log(warning);

                //start recording when video is loaded
                video.addEventListener('loadeddata', function () {
                        if(appScope.leaveResponse == true) {
                            setTimeout(function () {
                                mediaRecorder.start(1000);
                            }, warning );
                        }
                    video.muted = 'true';
                })

                let end = false;
                let timeout = (appScope.currentQuestion.recording_duration + this.warningTime) * 1000;
                console.log(timeout);
                setTimeout(function () {
                    end = true;
                }, timeout)

                this.startAudio(stream);
                //save data as it becomes available. Stop recording if stop button has been triggered
                mediaRecorder.addEventListener('dataavailable', function (e) {
                    if (e.data.size > 0) {
                        recordedChunks.push(e.data);
                    }
                    if(end){
                        mediaRecorder.stop();
                    }

                });

                //when recording stops, save the video object and stop displaying video stream
                mediaRecorder.addEventListener('stop', function () {
                    audioStream.stop();
                    videoStream.stop();

                    appScope.leaveResponse = false;
                    appScope.responded = true;

                    const blob = new Blob(recordedChunks, {type: 'video/webm'});
                    var href = URL.createObjectURL(new Blob(recordedChunks), {type: 'video/webm'});

                    appScope.saveVideoMessage(blob, href);



                })

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
                    if (appScope.leaveResponse == true) {
                        mediaRecorder.stop();
                    }
                });

                //when recording stops, save the video object and stop displaying video stream
                mediaRecorder.addEventListener('stop', function () {
                    audioStream.stop();
                    videoStream.stop();


                })
            },
            saveVideoMessage: function(blob, href){
                //append all needed information into a form
                let data = new FormData();
                data.append('user', this.$store.state.user.id);
                data.append('character', this.clickedCharacter);
                data.append('question', this.currentQuestion.question_id);

                //fetch the data saved into the blob
                axios
                    .get(
                        href,
                        { responseType: 'blob'}
                    ).then(function (response) {
                    //read in data from saved blob url
                    var reader = new FileReader();
                    reader.readAsDataURL(response.data, {type: 'application/octet-stream'});
                    reader.onloadend = function () {
                        var base64data = reader.result;
                        //append blob data to the form
                        data.append('blob', base64data);
                        //submit form with all needed data
                        axios
                            .post(
                                "/saveFile",
                                data
                            )
                            .then(r => console.log(r))
                            .catch(e => console.log(e));
                    };
                })
            },

            //these functions handle the audio display
            startAudio: function() {
                //start collecting audio stream
                navigator.mediaDevices.getUserMedia({ audio: true }).then(stream => {
                    // store streaming data chunks in array
                    const chunks = [];

                    //set paramaters of the Audio Stream
                    var audioCtx = new (window.AudioContext || window.webkitAudioContext)();
                    var analyser = audioCtx.createAnalyser();
                    analyser.minDecibels = -90;
                    analyser.maxDecibels = -10;
                    analyser.smoothingTimeConstant = 0.85;
                    analyser.fftSize = 256;

                    //get canvas element that will display the animation
                    let canvasCtx = document.getElementById('visualizer');
                    canvasCtx = canvasCtx.getContext("2d");

                    // create media recorder instance to initialize recording
                    const recorder = new MediaRecorder(stream);

                    //connect the audio stream to the incoming audio
                    let source = audioCtx.createMediaStreamSource(stream);
                    source.connect(analyser);

                    //call animation function
                    this.visualize(analyser, canvasCtx);

                    // function to be called when data is received
                    recorder.ondataavailable = e => {
                        // add stream data to chunks
                        chunks.push(e.data);
                    };
                    // start recording with 1 second time between receiving 'ondataavailable' events
                    recorder.start(300);

                }).catch(console.error);
            },
            visualize: function (analyser, canvasCtx) {
                //set the dimensions of animation
                const WIDTH = 400;
                const HEIGHT = 150;

                //convert data to the correct format
                analyser.fftSize = 256;
                let bufferLengthAlt = analyser.frequencyBinCount;
                let dataArrayAlt = new Uint8Array(bufferLengthAlt);

                //clear the canvas to prepare for animation
                canvasCtx.clearRect(0, 0, WIDTH, HEIGHT);

                //set recursive function to continuously draw to canvas
                let drawAlt = function () {
                    let drawVisual = requestAnimationFrame(drawAlt);

                    analyser.getByteFrequencyData(dataArrayAlt);

                    //set canvas background color and add animation
                    canvasCtx.fillStyle = '#4a4a4a';
                    canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);

                    //define the width of audio bar display
                    let barWidth = (WIDTH / bufferLengthAlt) * 1.25;
                    let barHeight;
                    let x = 0;

                    //iterate through audio levels and add bars to canvas
                    for (let i = 0; i < bufferLengthAlt; i++) {
                        barHeight = dataArrayAlt[i];

                        canvasCtx.fillStyle = 'rgb(255, 255, 255)';
                        canvasCtx.fillRect(x, HEIGHT - barHeight / 2, barWidth, barHeight / 2);

                        x += barWidth + 1;
                    }
                };

                drawAlt();
            }
        }
    }

</script>git

<style scoped lang="scss">
    @import "../../../sass/_variables.scss";

    a {
        color: white;
    }
    canvas {
        height: 30px;
        width: 40px;
    }
    .video-container {
        position: relative;
        background-color: #000;
    }
    #controlBar{
        display: flex;
        justify-content: space-between;
        padding: 0px 10px;
        background-color: $sim-heading;
        height: 40px;
        font-size: 25px;
        margin-top: 0px;
    }
    #recording{
        color: red;
    }
    #call_video{
        height: calc(19vh - 11px);
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
    .dropdown-toggle::after {
        display:none
    }
    #personal_video{
        position: absolute;
        right: 0px;
        top: 137px;
        height: 125px;
        width: 150px;
    }

    @media(min-width:1150px){
        #call_video {
            height: calc(23vh - 20px);
        }
        #personal_video{
            top: 182px;
        }
    }
</style>