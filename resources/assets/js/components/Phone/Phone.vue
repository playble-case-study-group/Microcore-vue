<template>
    <div class="container">
        <ul>
            <li v-for="call in calls" @click="loadCallVideo(call)">
                {{ call.call_url }}
            </li>
        </ul>
        <character-video :video="currentVideo" :current_question="currentQuestion"></character-video>
        <character-questions :questions="currentQuestions" v-on:question="askQuestion"></character-questions>
    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'
    import Video from './Video.vue'
    import Questions from './Questions.vue'

    export default {
        components: {
            'character-video': Video,
            'character-questions': Questions
        },
        props: ['calls', 'questions'],
        mounted() {
            console.log('Component mounted.')
            this.$on('question', (question) => console.log('on: ', question))
        },
        data: function () {
            return {
                currentVideo: {},
                currentQuestions: [],
                currentQuestion: {}
            }
        },
        methods: {
            loadCallVideo: function (call) {
                this.currentVideo = call;
                this.currentQuestions = this.questions[call.id];
            },
            askQuestion: function (question) {
                this.currentQuestion = question;
            }
        }

    }
</script>
