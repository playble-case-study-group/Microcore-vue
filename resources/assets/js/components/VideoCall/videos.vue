<template>
    <div id="video">
        <video width="520" id="call_video" height="340">
            <source :src="current_src" type="video/mp4">
        </video>

        <div id="controlBar">
            <a href="#"><i id="phonebook" class="material-icons">contacts</i></a>
            <a href="#" v-on:click="call"><i id="call" class="material-icons">call</i></a>
            <div id="volume" >
                <a href="#"><i class="material-icons">volume_down</i></a>
                <a href="#" v-on:click="volume_down"><i id="volume" class="material-icons">remove</i></a>
                <a href="#" v-on:click="volume_up"><i id="volume" class="material-icons">add</i></a>
            </div>
        </div>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        props: ['video', 'current_question'],
        data: function () {
            return {
                video_el: {},
                current_src: "",
            }
        },
        watch: {

            video: function () {
                this.video_el = document.getElementById('call_video');
                this.current_src = this.video.call_url;
                this.video_el.load();
            },
            current_question: function () {
                document.getElementById('call_video').currentTime = (parseInt(this.current_question.start_time) + 0.51);
                console.log(this.video_el.currentTime);
                document.getElementById('call_video').play()

            }
        },
        methods: {
            call: function(){
                if(document.getElementById('call').innerText === "call"){
                    this.video_el.pause();
                    document.getElementById('call').innerText = "call_end";
                }else{
                    this.video_el.play();
                    document.getElementById('call').innerText = "call";
                }
            },
            volume_up: function(){
                this.video_el.volume = this.video_el.volume + 0.1;
            },
            volume_down: function(){
                document.getElementById('char_vid').volume = document.getElementById('char_vid').volume - 0.1;
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