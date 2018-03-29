<template>
    <div id="video">
        <!--video element to show standard videocalls, hidden when recording component is shown-->
        <video v-if="!showRecordingInterface" id="call_video" poster="/img/videocall/video-placeholder.jpg">
            <source :src="currentVideo.call_url" type="video/mp4">
        </video>

        <!--video recording component, hidden until click on inactive character-->
        <video-message v-if="showRecordingInterface" :recording="recording"></video-message>

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
                            <i class="material-icons">fiber_manual_record</i>
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
                //check if the contact clicked on is active
                let activeCall = this.calls.find((call) => {
                    if (call.character_id === person_id) {
                        return call;
                    }
                })
                console.log(activeCall);
                if (activeCall) {
                    //if active, return the questions associated with them
                    this.showRecordingInterface = false;
                    this.currentQuestions = this.questions.filter((question) => {
                        if (question.call_id == activeCall.id) {
                            return question;
                        }
                    })
                    this.currentVideo = activeCall;
                } else{
                    //if not active, leave a message
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
    .characterInfo{
        margin-left: 2rem;
        width: 58%;
    }
    .characterActive{
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