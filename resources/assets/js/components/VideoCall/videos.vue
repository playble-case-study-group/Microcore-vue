<template>
    <div id="video">
        <video preload="yes" width="520" id="char_vid" height="340">
            <source :src="videourl" type="video/mp4">
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

        watch:{
            vid_end: function(){
                this.question_seek();
            }
        },
        props: ['video', 'active', 'vid_start', 'vid_end'],
        computed: {
            videourl: function() {
                let contacts = this.video.filter((el) => {
                    if (el.charID === this.active) {
                        return el;
                    }
                })
                    .map((el) => {
                        return el.url;
                    })

                return contacts[0];
            }
        },
        methods: {
            question_seek: function(){
                let videoEl = document.getElementById('char_vid');
                videoEl.load();
                videoEl.play();
                videoEl = this.vid_start;
                console.log(videoEl.currentTime);
                videoEl.addEventListener("timeupdate", function() {
                    if (videoEl.currentTime >= this.vid_end ) {
                        videoEl.pause();
                    }
                }.bind(this), false);

            },
            call: function(){
                if(document.getElementById('call').innerText === "call"){
                    document.getElementById('char_vid').pause();
                    document.getElementById('call').innerText = "call_end";
                }else{
                    document.getElementById('char_vid').play();
                    document.getElementById('call').innerText = "call";
                }
            },
            volume_up: function(){
                document.getElementById('char_vid').volume = document.getElementById("char_vid").volume + 0.1;
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