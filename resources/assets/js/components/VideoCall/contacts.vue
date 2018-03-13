<template>
    <div class="'container">
    <character-video :video="current_video" :current_question="current_question"></character-video>
        <div id="contacts">
        <div class="contact-inner"
             v-for="person in this.contacts"
             :id="person.id"
             @click="load_call(person.id)">
                <img id="photo" src=""><br>
                <span id="name">{{person.name}}</span><br>
                <span id="position">{{person.role}}</span>
                <span v-if="activeContacts.includes(person.id)"><i id="active" class="material-icons">fiber_manual_record</i></span><br>
        </div>
    </div>
        <character-questions :questions="current_questions" v-on:question="question_asked"></character-questions>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import question from './question.vue'
    import videos from './videos.vue'

    export default {
        components: {
            'character-video': videos,
            'character-questions': question
        },
        props: ['calls', 'questions', 'contacts'],
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
        computed: {
            activeContacts: function() {
                let contacts = this.calls.filter((contact) => {
                    if(contact.day === this.$store.state.user.current_day){
                        return contact.character_id;
                    }
                })
                    .map((contact) => {
                        return contact.character_id;
                    })
                return contacts;
            }
        },
        methods: {
            load_call: function (person_id) {

                let activeCall = this.calls.filter((call) => {
                    if(call.day === this.$store.state.user.current_day && call.character_id === person_id){
                        return call;
                    }
                })

                let activeCallQuestions = this.questions.filter((question) => {
                    if(question.call_id == activeCall[0].id){
                        return question;
                    }
                })

                this.current_video = activeCall[0];
                this.current_questions = activeCallQuestions;
            },
            question_asked: function (question) {
                this.current_question = question;
            }
        }
    }
</script>

<style scoped>
    #contacts {
        display: flex;
        flex-flow: wrap;


    }
    .contact-inner{
        padding: 10px;
    }
    #active{
        color: #3c763d;
    }

</style>