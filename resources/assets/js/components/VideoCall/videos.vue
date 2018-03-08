<template>
    <div id="video">
        <video preload="yes" width="520" id="char_vid" height="340" controls="true">
            <source :src="videourl" type="video/mp4">
        </video>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        watch:{
            vid_end: function(){
                this.begin();
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
            },
        },
        methods: {
            begin: function(){
                let videoEl = document.getElementById('char_vid');
                videoEl.load();
                videoEl.currentTime = this.vid_start;
                videoEl.play();
                console.log(videoEl.currentTime);
                videoEl.addEventListener("timeupdate", function() {
                    if (videoEl.currentTime >= this.vid_end ) {
                        videoEl.pause();
                    }
                }.bind(this), false);

            }
        }
    }

</script>

<style scoped>
    .content {
        padding: 20px;
    }

    #video {
        /*border: solid 1px;*/
    }

</style>