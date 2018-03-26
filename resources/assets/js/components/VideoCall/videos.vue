<template>
    <div id="video">
        <video id="call_video" autoplay controls>
            <source :src="currentVideo.call_url" type="video/mp4">
        </video>
        <div id="controlBar">
            <div class="dropup">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i id="phonebook" class="material-icons">contacts</i>
                </a>
                <div id="contacts" class="dropdown-menu">
                    <div class="contact-inner dropdown-item"
                         v-for="person in this.characters"
                         :id="person.id"
                         @click="loadCallVideo(person.id)">
                        <img id="characterImage" :src="person.img_small">
                        <div id="contactInfo">
                            <span id="name">{{person.name}}</span><br>
                            <span id="position">{{person.role}}</span>
                        </div>
                        <span id="active" v-if="activeContacts.includes(person.id)"><i class="material-icons">fiber_manual_record</i></span>
                    </div>
                </div>
            </div>
            <a href="#" v-on:click="changePhoneIcon"><i id="call" class="material-icons">{{this.callIconToggleStatus}}</i></a>
            <a href="#" v-on:click="changeMicIcon"><i id="mic" class="material-icons">mic</i></a>
        </div>
        <character-questions id="characterQuestions"
                             :questions="this.currentQuestions"
                             v-on:question="askQuestion">
        </character-questions>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import question from './question.vue'

    export default {
        props: ['calls', 'characters', 'questions'],
        data: function () {
            return {
                videoEl: {},
                callIconToggleStatus: "call",
                currentQuestion: {},
                currentQuestions: [],
                currentVideo: {},
                record: false
            }
        },
        components: {
            'character-questions': question
        },
        watch: {
            currentVideo: function () {
                this.videoEl = document.getElementById('call_video');
                this.currentSrc = this.currentVideo.call_url;
                this.videoEl.load();
                this.callIconToggleStatus = "call";
            },
            currentQuestion: function () {
                document.getElementById('call_video').currentTime = (parseInt(this.currentQuestion.start_time) + 0.51);
                console.log(this.videoEl.currentTime);
                document.getElementById('call_video').play()
                this.callIconToggleStatus = "call_end";

            }
        },
        computed: {
            activeContacts: function() {
                let characters = this.calls.filter((character) => {
                    if(character.day === this.$store.state.user.current_day){
                        return character.character_id;
                    }
                })
                    .map((character) => {
                        return character.character_id;
                    })
                return characters;
            }
        },
        methods: {
            loadCallVideo: function (person_id) {
                let activeCall = this.calls.filter((call) => {
                    if (call.day === this.$store.state.user.current_day && call.character_id === person_id) {
                        return call;
                    }
                })
                if (activeCall.length != 0) {
                    this.record = false;
                    let activeCallQuestions = this.questions.filter((question) => {
                        if (question.call_id == activeCall[0].id) {
                            return question;
                        }
                    })
                    this.currentVideo = activeCall[0];
                    this.currentQuestions = activeCallQuestions;
                } else{
                    this.leaveMessage();
                }
            },
            leaveMessage: function(){
                this.record = true;
               this.requestAudioVideo();
            },
            requestAudioVideo: function(){
                function hasGetUserMedia() {
                    return !!(navigator.mediaDevices && navigator.mediaDevices.getUserMedia);
                }
                const constraints = {
                    video: true,
                    audio: true
                };
                const video = document.querySelector('video');
                console.log(video);
                function handleSuccess(stream) {
                    video.srcObject = stream;
                }

                function handleError(error) {
                    console.error('Reeeejected!', error);
                }

                if (hasGetUserMedia()) {
                    console.log('got it~');
                    console.log(video.srcObject);
                    navigator.mediaDevices.getUserMedia(constraints).
                    then(handleSuccess).catch(handleError);
                } else {
                    alert('getUserMedia() is not supported by your browser');
                }
            },
            changePhoneIcon: function(){
                if(this.callIconToggleStatus === "call"){
                    this.videoEl.play();
                    this.callIconToggleStatus = "call_end";
                } else {
                    this.videoEl.pause();
                    this.callIconToggleStatus = "call";
                }
            },
            changeMicIcon: function(){
                if(document.getElementById('mic').innerText === "mic"){
                    document.getElementById('mic').innerText = "mic_off";
                } else{
                    document.getElementById('mic').innerText = "mic";
                }
            },
            askQuestion: function (question) {
                this.currentQuestion = question;
            },
        }
    }

</script>

<style scoped>
    a {
        color: white;
    }
    #controlBar{
        display: flex;
        justify-content: space-between;
        padding: 0px 15px;
        background-color: #4A4A4A;
        height: 50px;
        font-size: 30px
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
    #contactInfo{
        margin-left: 2rem;
        width: 58%;
    }
    #active{
        color: #3c763d;
        align-self:center;
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
    @media(min-width: 992px){
        #controlBar{

        }
    }

</style>