<template>
    <div class="container">
        <ul>
            <li v-for="call in calls" @click="load_call(call)">
                {{ call.call_url }}
            </li>
        </ul>
        <character-video :video="current_video" :current_question="current_question"></character-video>
        <character-questions :questions="current_questions" v-on:question="question_asked"></character-questions>
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
                current_video: {},
                current_questions: [],
                current_question: {}
            }
        },
        methods: {
            load_call: function (call) {
                this.current_video = call;
                this.current_questions = this.questions[call.id];
            },
            question_asked: function (question) {
                this.current_question = question;
            }
        }

    }
</script>
