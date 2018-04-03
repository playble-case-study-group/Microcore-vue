<template>
    <div class="container">
        <h1>Video</h1>
        <video id="call_video" width="320" height="240" controls>
            <source :src="currentSrc" type="video/mp4">
            Your browser does not support the video tag.
        </video>

        <div id="player"></div>


    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        props: ['video', 'currentQuestion'],
        data: function () {
            return {
                videoEl: {},
                currentSrc: "",
            }
        },
        methods: {

        },
        watch: {

            video: function () {
                this.videoEl = document.getElementById('call_video');
                this.currentSrc = this.video.call_url;
                this.videoEl.load();
            },
            currentQuestion: function () {
                document.getElementById('call_video').currentTime = (parseInt(this.currentQuestion.start_time) + 0.51);
                console.log(this.videoEl.currentTime);
                document.getElementById('call_video').play()



            }
        }
    }
</script>