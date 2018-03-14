<template>
    <div id="video">
        <video width="520" id="call_video" height="340">
            <source :src="currentSrc" type="video/mp4">
        </video>

        <div id="controlBar">
            <a href="#"><i id="phonebook" class="material-icons">contacts</i></a>
            <a href="#" v-on:click="changePhoneIcon"><i id="call" class="material-icons">call</i></a>
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
            }
        },
        watch: {
            video: function () {
                this.videoEl = document.getElementById('call_video');
                this.currentSrc = this.video.call_url;
                this.videoEl.load();
                document.getElementById('call').innerHTML = "call";
            },
            currentQuestion: function () {
                document.getElementById('call_video').currentTime = (parseInt(this.currentQuestion.start_time) + 0.51);
                console.log(this.videoEl.currentTime);
                document.getElementById('call_video').play()

            }
        },
        methods: {
            changePhoneIcon: function(){
                if(document.getElementById('call').innerText === "call"){
                    this.videoEl.pause();
                    document.getElementById('call').innerText = "call_end";
                }else{
                    this.videoEl.play();
                    document.getElementById('call').innerText = "call";
                }
            },
            changeMicIcon: function(){
                if(document.getElementById('mic').innerText === "mic"){
                    document.getElementById('mic').innerText = "mic_off";
                } else{
                    document.getElementById('mic').innerText = "mic";
                }
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
        background-color: #2b2b2b;
        height: 40px;

    }
    #volume{
    }
    #call, #end_call{
    }

</style>