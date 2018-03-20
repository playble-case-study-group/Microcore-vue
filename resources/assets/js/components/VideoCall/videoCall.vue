<template>
    <div id="videocall" class="container">
        <div class="row">
            <notes id="notesParent"  class="col-md-12 col-lg-4 order-sm-12" :notes="this.notes"></notes>
            <character-video v-on:loadVideo="loadCallVideo" :active="activeContacts" :characters="this.contacts" :video="currentVideo" :currentQuestion="currentQuestion"></character-video>
            <character-questions id="characterQuestions" :questions="currentQuestions" v-on:question="askQuestion"></character-questions>

        </div>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import notes from './notes.vue'
    import question from './question.vue'
    import videos from './videos.vue'


    export default {

        components: {
            'notes': notes,
            'character-video': videos,
            'character-questions': question
        },
        props: ['calls', 'questions', 'notes', 'contacts'],
        mounted() {
            console.log('Component mounted.')
            this.$on('question', (question) => console.log('on: ', question))
        },
        data: function () {
            return {
                currentVideo: {},
                currentQuestions: [],
                currentQuestion: {}
            }
        },
        computed: {
            activeContacts: function() {
                let characters = this.calls.filter((character) => {
                    if(character.day === this.$store.state.user.current_day){
                        return character.character_id;
                    }
                })
                    .map((character) => {
                        return character.character_id;
                    })
                return characters;
            }
        },
        methods: {
            loadCallVideo: function (person_id) {
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

                this.currentVideo = activeCall[0];
                this.currentQuestions = activeCallQuestions;
            },
            askQuestion: function (question) {
                this.currentQuestion = question;
            },
        }
    }
</script>

<style scoped>
    #videocall{
        margin: 0px 20px;
    }
    #notesParent{
        height:70rem;
    }
    #contactsParent{

    }

</style>