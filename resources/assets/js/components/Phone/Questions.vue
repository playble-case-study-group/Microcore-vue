<template>
    <div class="container">
        <h1>Questions</h1>
        <ul>
            <li v-for="question in questions" @click="submitQuestion(question)">
                {{ question.question }}
            </li>
        </ul>
    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        props: ['questions'],
        methods: {
            submitQuestion: function (question) {
                this.$emit('question', question)
            }
        },

    }
</script>