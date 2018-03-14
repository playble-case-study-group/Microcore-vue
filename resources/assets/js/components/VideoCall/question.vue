<template>
    <div id="question">
        <br>
        <button class="single-question"
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
    button {
        padding: 20px;
        background-color: #2ab27b;
        color: white;
        border: none;
    }
    button:hover {
        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.24), 0 6px 20px 0 rgba(0,0,0,0.19);
    }

    #question {

    }

</style>