<template>
    <div id="question">
        <div class="counterDisplay col-sm-12" v-if="this.count > 0">
            <br><br>
            <p v-if="!this.warning">
                You will have {{ this.countdown }} seconds to respond.<br>
                Recording will start in : <span class="counter">{{ this.count }}</span></p>
            <p v-else> Time Remaining: <span class="counter">{{ this.count }}</span></p>
        </div>
        <button type="button"
                v-for="question in questions"
                class="btn btn-success btn-lg button"
                :disabled = returnClass(question)
                v-if="question.question && showButtons && count == 0"
                :key="question.id"
                @click="submitQuestion(question)">
            <b>{{ question.question }}</b>
        </button>
    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'

    export default {


        data() {
            return{
                count: 0,
                warning: false,
                showButtons: true
            }
        },
        watch: {
          countdown: function(){
              if( this.count == 0 ){
                  this.count = this.warningTime;
                  this.startCount();
                  this.showButtons = false;
              }
          },
           warning: function() {
               this.count = this.countdown;
               this.startCount();
               this.showButtons = true;
           }
        },
        props: {
            questions: Array,
            countdown: Number,
            warningTime: Number,
            disabledQuestions: Array
        },
        methods: {
            submitQuestion: function (question) {
                this.$emit('question', question)
                this.disabledQuestions.push({'user_id': this.$store.state.user.id, 'question_id': question.question_id, 'day': this.$store.state.user.current_day});
                this.returnClass(question);
                this.$forceUpdate();
                axios.post(
                    '/clickedQuestion',
                    {
                        id: question.question_id
                    }
                ).then(res => console.log(res)
                ).catch( error => console.log(error));
            },
            startCount: function() {
                let appScope = this;
                let timer = setInterval(function () {
                    if (appScope.count > 0) {
                        appScope.count -= 1;
                    }
                    else {
                        appScope.warning = true;
                        clearInterval(timer);
                    }
                }, 1000);
            },
            returnClass: function(question) {
                let clicked = this.disabledQuestions.find( function(el) {
                    if(el.question_id == question.question_id){
                        return el;
                    }
                })
                if(clicked){
                    return true
                } else{
                    return false
                }
            }
        },

    }
</script>


<style scoped>
    .button {
        margin: 2rem;
        height: 3rem;
        width: 26rem;
    }
    .counterDisplay {
        font-size: 24px;
        text-align: center;
    }
    .counter {
        padding-left: 40px;
        color: #dc3545;

    }
    @media(min-width: 992px){
        .button {
            margin: 25px 25px;
            height: 4rem;
            width: 13rem;
            white-space: normal;
        }
    }
    @media(min-width: 1400px){
        .button {
            margin: 2rem 2rem;
            height: 4rem;
            width: 17rem;
        }
    }
</style>