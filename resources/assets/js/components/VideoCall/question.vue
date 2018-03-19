<template>
    <div id="question">
        <br>
        <button type="button" class="btn btn-success"
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
    #question {
        display:flex;
        justify-content: space-between;
        height: auto;
        background-color: white;
    }
    #single-question{
        display: block;
    }

</style>