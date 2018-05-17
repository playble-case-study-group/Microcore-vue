<template>
    <div id="question">
        <div class="counterDisplay col-sm-12" v-if="this.count > 0">
            <br><br>
            <p v-if="!this.warning">
                You will have {{ this.countdown }} seconds to respond.<br>
                Recording will start in : <span class="counter">{{ this.count }}</span></p>
            <p v-else> Time Remaining: <span class="counter">{{ this.count }}</span></p>
        </div>
        <button type="button" class="btn btn-success btn-lg button"
                v-for="question in questions"
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
                  this.count = 3;
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
            countdown: Number
        },
        methods: {
            submitQuestion: function (question) {
                this.$emit('question', question)
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