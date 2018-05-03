<template>
    <div id="question">
        <div v-if="this.count > 0">
            {{ this.count }}
        </div>
        <button type="button" class="btn btn-success btn-lg button"
             v-for="question in questions"
                v-if="question.question"
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
        data() {
            return{
                count: 0,
                warning: 0
            }
        },
        watch: {
          countdown: function(){
              if( this.count == 0 ){
                  this.count = 3;
                  this.startCount();
              }
          },
           warning: function() {
               this.count = this.countdown;
               this.startCount();
           }
        },
        props: ['questions', 'countdown'],
        methods: {
            submitQuestion: function (question) {
                this.$emit('question', question)
            },
            startCount: function() {
                let appScope = this;
                let timer = setInterval(function () {
                    if (appScope.count > 0) {
                        appScope.count -= 1;
                        console.log(appScope.count);
                    }
                    else {
                        appScope.warning = true;
                        clearInterval(timer);
                    }
                }, 1000);
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