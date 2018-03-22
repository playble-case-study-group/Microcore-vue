<template>
    <div id="videocall" class="container">
        <div class="row">
            <div class="d-flex">
                <notes id="notesParent" class="col-sm-11 col-md-11 col-lg-3"
                       :notes="this.notes">
                </notes>
                <character-video class="col-sm-11 col-md-11 col-lg-8"
                                 v-on:loadVideo="loadCallVideo"
                                 :active="activeContacts"
                                 :characters="this.contacts"
                                 :video="currentVideo"
                                 :questions="currentQuestions">

                </character-video>
           </div>
        </div>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import notes from './notes.vue'
    import videos from './videos.vue'

    export default {

        components: {
            'notes': notes,
            'character-video': videos,
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
        }
    }
</script>

<style scoped>
    #videocall{
        margin: 3rem 3rem;
    }
    #notesParent{
        height:40rem;
        top: 15px;
    }
    .d-flex{
        display: flex;
        flex-flow: column-reverse;
    }
    @media(min-width:992px){
        .d-flex{
            flex-flow: initial;
            justify-content: space-evenly;
        }
        #notesParent{
            height:70rem;
            top: -22px;
        }
    }

</style>