<template>
    <div class="container">
        <h1>Video</h1>
        <video id="call_video" width="320" height="240" controls>
            <source :src="current_src" type="video/mp4">
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
        props: ['video', 'current_question'],
        data: function () {
            return {
                video_el: {},
                current_src: "",
            }
        },
        methods: {

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
        }
    }
</script>