<template>
    <div id="video">
        <video width="520" id="char_vid" height="340" :src="videourl" controls>
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
                videoEl.currentTime = this.vid_start;
                videoEl.play();
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