<template>
    <div id="question">
        <button type="button" class="btn btn-success btn-lg button"
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
        margin: 2rem;
        height: 5rem;
        width: 22rem;
    }
    @media(min-width: 992px){
        .button {
            margin: 1rem 3rem;
            height: 7rem;
            width: 21rem;
            white-space: normal;
        }
    }
    @media(min-width: 1400px){
        .button {
            margin: 2rem 4rem;
            height: 5rem;
            width: 28rem;
        }
    }
</style>