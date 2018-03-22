<template>
    <div id="video">
        <video id="call_video">
            <source :src="currentSrc" type="video/mp4">
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
                        <span id="active" v-if="active.includes(person.id)"><i class="material-icons">fiber_manual_record</i></span>
                    </div>
                </div>
            </div>
            <a href="#" v-on:click="changePhoneIcon"><i id="call" class="material-icons">{{this.callIconToggleStatus}}</i></a>
            <a href="#" v-on:click="changeMicIcon"><i id="mic" class="material-icons">mic</i></a>
        </div>
        <character-questions id="characterQuestions"
                             :questions="this.questions"
                             v-on:question="askQuestion">
        </character-questions>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import question from './question.vue'

    export default {
        props: ['active', 'video', 'characters', 'questions'],
        data: function () {
            return {
                videoEl: {},
                currentSrc: "",
                callIconToggleStatus: "call",
                currentQuestion: {}
            }
        },
        components: {
            'character-questions': question
        },
        watch: {
            video: function () {
                this.videoEl = document.getElementById('call_video');
                this.currentSrc = this.video.call_url;
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
        methods: {
            loadCallVideo: function (person_id) {
                this.$emit('loadVideo', person_id)
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
        overflow-y: hidden;
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