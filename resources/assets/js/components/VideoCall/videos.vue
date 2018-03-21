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
                        <img :src="person.img_small">
                        <div id="contactInfo">
                            <span id="name">{{person.name}}</span><br>
                            <span id="position">{{person.role}}</span>
                            <span v-if="active.includes(person.id)"><i id="active" class="material-icons">fiber_manual_record</i></span><br>
                        </div>
                    </div>
                </div>
            </div>

            <a href="#" v-on:click="changePhoneIcon"><i id="call" class="material-icons">{{this.callIconToggleStatus}}</i></a>
            <a href="#" v-on:click="changeMicIcon"><i id="mic" class="material-icons">mic</i></a>
        </div>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {
        props: ['active', 'video', 'currentQuestion', 'characters'],
        data: function () {
            return {
                videoEl: {},
                currentSrc: "",
                callIconToggleStatus: "call",
            }
        },
        computed: {

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
        }
    }

</script>

<style scoped>
    a {
        color: white;
    }
    #video{
        /*width: 600px;*/
    }
    #controlBar{
        display: flex;
        justify-content: space-between;
        padding: 0px 25px;
        background-color: #4A4A4A;
        height: 50px;
        font-size: 30px
    }
    #call_video{
        /*height: inherit;
        width: inherit;*/
    }
    #call{
    }
    .contact-inner{
        padding: 10px;
    }
    #active{
        color: #3c763d;
    }
    #characterQuestions{
        height: 150px;
        overflow-y: scroll;
        background-color: white;
    }
    @media(min-width: 992px){
        #controlBar{

        }
    }

</style>