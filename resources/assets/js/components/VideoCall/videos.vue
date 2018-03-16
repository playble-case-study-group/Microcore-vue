<template>
    <div id="video">
        <video width="520" id="call_video" height="340">
            <source :src="currentSrc" type="video/mp4">
        </video>

        <div id="controlBar">
            <a href="#" v-on:click="showContacts"><i id="phonebook" class="material-icons">contacts</i></a>
            <a href="#" v-on:click="changePhoneIcon"><i id="call" class="material-icons">{{this.callIconToggleStatus}}</i></a>
            <div id="volume" >
                <a href="#" v-on:click="changeMicIcon"><i id="mic" class="material-icons">mic</i></a>
            </div>
        </div>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {
        props: ['video', 'currentQuestion'],
        data: function () {
            return {
                videoEl: {},
                currentSrc: "",
                callIconToggleStatus: "call",
            }
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
            showContacts: function(){
                this.$emit('showContacts');
            }
        }
    }

</script>

<style scoped>
    #video {
        float: top;
    }
    a {
        color: white;
    }
    #controlBar{
        display: flex;
        justify-content: space-between;
        padding: 0px 25px;
        background-color: #4A4A4A;
        height: 50px;
        font-size: 30px
    }
    #volume{
    }
    #call{
    }
    @media(min-width: 992px){
        #controlBar{

        }
    }

</style>