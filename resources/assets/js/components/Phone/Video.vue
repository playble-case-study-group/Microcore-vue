<template>
    <div class="container">
        <h1>Video</h1>
        <video id="call_video" width="320" height="240" controls>
            <source :src="current_src" type="video/mp4">
            Your browser does not support the video tag.
        </video>

        <div id="player"></div>

        <!--<iframe width="560"-->
                <!--height="315"-->
                <!--src="https://www.youtube.com/embed/z68CQkD7mz4?modestbranding=1&amp;rel=0&amp;controls=0&amp;showinfo=0&amp;start=90&amp;autoplay=1&amp;end=100"-->
                <!--frameborder="0"-->
                <!--allow="autoplay; encrypted-media"-->
                <!--autoplay="1"-->
                <!--allowfullscreen>-->
        <!--</iframe>-->

        <!--<vimeo-player :video-id="video_id" :autoplay="1"></vimeo-player>-->

    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'
    import { vueVimeoPlayer } from 'vue-vimeo-player'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        components: {
            'vimeo-player': vueVimeoPlayer
        },
        props: ['video', 'current_question'],
        data: function () {
            return {
                video_el: {},
                current_src: "",
                video_id: "256090416",
                video_props: {
                    autoplay: 1,
                    'startSeconds': 20,
                    'endSeconds': 60,
                    'suggestedQuality': 'large'
                }
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
//                this.current_src = this.video.call_url + '#' + this.current_question.start_time + ',' + this.current_question.end_time;
                document.getElementById('call_video').currentTime = (parseInt(this.current_question.start_time) + 0.51);
                console.log(this.video_el.currentTime);
                this.video_el.addEventListener('canplay', function () {
                    this.play();
                }, false);

            }
        }
    }
</script>