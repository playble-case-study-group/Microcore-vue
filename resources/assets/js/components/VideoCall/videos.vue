<template>
    <div id="video">
        <video id="call_video">
            <source :src="currentSrc" type="video/mp4">
        </video>
        <div id="controlBar">
            <a href="#" data-toggle="popover"><i id="phonebook" class="material-icons">contacts</i></a>
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
    @media(min-width: 992px){
        #controlBar{

        }
    }

</style>