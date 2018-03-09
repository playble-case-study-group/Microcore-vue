<template>
    <div id="videocall" class="container">
        <notes id="notes" :notes="extractNote"></notes>
        <contacts id="contacts"
                :contacts_info="contactsList"
                :contacts="this.contacts"
                :video="videoList"
                :chosenContact="chosenContact"
                :questions="questionsList">
        </contacts>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import contacts from './contacts.vue'
    import notes from './notes.vue'


    export default {

        mounted() {
        },
        components: {
            'contacts': contacts,
            'notes': notes
        },
        props: ['videos', 'notes', 'contacts'],
        data: function() {
            return {
                chosenContact: 0
            }
        },
        computed:{
            currentDay: function(){
                return this.$store.state.user.current_day;
            },
            videoList: function() {
                  let videos = this.videos.filter((video) => {
                        if(video.day === this.currentDay){
                            return video
                        }
                    })
                      .map((video) => {
                      return {'url': video.video, 'charID': video.character_id}
                })

                return videos;
            },
            questionsList: function() {
                let questions = this.videos.filter((question) => {
                    if(question.day === this.currentDay){
                        return question
                    }
                })
                    .map((question) => {
                        return {'question': question.question, 'charID': question.character_id, 'start': question.video_starttime, 'end': question.video_endtime }
                    })

                return questions;

            },
            contactsList: function() {
                let characters = this.videos.map((character) => {
                    return {'charID': character.character_id, 'day': character.day }
                })

                return characters;
            },
            extractNote: function(){
                let note = this.notes.map((note) => {
                    return note.note;
                })

                return note;
            }
        }
    }
</script>

<style scoped>
    #videocall{
        display: flex;
        flex-direction: row;

    }
    #notes{

    }
    #contacts{

    }

</style>