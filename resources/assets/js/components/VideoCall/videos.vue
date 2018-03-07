<template>
    <div id="video">
        <video width="520" id="char_vid" height="340" :src="videourl" controls>
        </video>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {


        data() {
            return {
                start: 0,
                end: 0
            }
        },
        beforeUpdate() {
            this.vidTiming();
        },
        update(){
            this.begin(this.start, this.end);
        },
        props: ['video', 'active', 'question'],
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
            vidTiming: function() {
                this.video.filter((el) => {
                    if (el.id === this.question) {
                        this.start = el.start;
                        this.end = el.end;
                        return el;
                    }
                })
            },
            begin: function(start, end){
                let object = document.getElementById('char_vid');
                console.log(object);
                object.addEventListener("timeupdate", function() {
                    if (object.currentTime >= this.end && object.currentTime <= parseInt(this.end, 10) + 0.5) {
                        object.pause();
                    }
                }, false);
                object.currentTime = start;
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