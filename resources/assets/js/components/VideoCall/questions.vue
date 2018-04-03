<template>
    <div id="questions">
        <question v-on:play="vPlay" :question="activeQuestions"></question><br>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import question from './question.vue'

    export default {

        mounted() {
        },
        props: ['questions', 'active'],
        components: {
            'question': question,
        },
        computed: {
            activeQuestions: function() {
                let question = this.questions.filter((el) => {
                    if (el.charID === this.active) {
                        return el;
                    }
                })
                return question;
            }
        },
        methods: {
            vPlay: function(start, end){
                this.$emit('vPlay', start, end);
            }
        }
    }
</script>

<style scoped>
    #questions{
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: space-evenly;
        background-color: white;

    }

</style>