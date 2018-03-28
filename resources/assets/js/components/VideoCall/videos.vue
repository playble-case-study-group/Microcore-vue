<template>
    <div id="video">
        <video v-if="!showRecordingInterface" id="call_video" poster="/img/videocall/video-placeholder.jpg">
            <source :src="currentVideo.call_url" type="video/mp4">
        </video>
        <video-message v-if="showRecordingInterface" :recording="recording"></video-message>
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
            <a href="#" v-if="showRecordingInterface" v-on:click="startStopRecording"><i id="recording" class="material-icons">fiber_manual_record</i></a>
            <a href="#" v-if="!showRecordingInterface" v-on:click="changePhoneIcon"><i id="call" class="material-icons">{{this.callIconToggleStatus}}</i></a>
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
                recording: false
            }
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
                    this.showRecordingInterface = false;
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
                this.showRecordingInterface = true;
                this.currentQuestions = [];
                this.currentQuestion = {};
                this.currentVideo = {};
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
            startStopRecording: function(){
                this.recording = !this.recording;
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