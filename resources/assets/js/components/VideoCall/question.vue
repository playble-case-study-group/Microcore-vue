<template>
    <div id="question">
        <button type="button" class="btn btn-success button"
             v-for="question in questions"
             :id="question.id"
                @click="submitQuestion(question)">
            <b>{{ question.question }}</b>
        </button>
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


<style scoped>
    .button {
        margin: 20px;

    }
</style>