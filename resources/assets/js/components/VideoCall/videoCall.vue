<template>
    <div id="videocall" class="container">
        <h1>Video Mail</h1>
        <contacts
                :contacts="contactsList"
                :video="videoList"
                :chosenContact="chosenContact"
                :questions="questionsList">

        </contacts>
        <notes></notes>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import contacts from './contacts.vue'
    import notes from './notes.vue'


    export default {

        mounted() {
            console.log('Component mounted.')
        },
        components: {
            'contacts': contacts,
            'notes': notes
        },
        props: ['videos'],
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
                      return {'url': video.video, 'charID': video.character_ID}
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
                        return {'question': question.question, 'charID': question.character_ID,'start': question.video_startTime, 'end': question.video_endTime }
                    })

                return questions;

            },
            contactsList: function() {
                let characters = this.videos.map((character) => {
                    return {'charID': character.character_ID, 'day': character.day }
                })

                return characters;
            }
        }
    }
</script>