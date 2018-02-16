<template>
    <div id="videocall">

        <h1>Video Mail</h1>
        <videos :video="videoList"></videos>
        <contacts :contacts="contactsList"></contacts>
        <questions :questions="questionsList"></questions>
        <notes></notes>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import contacts from './contacts.vue'
    import video from './videos.vue'
    import notes from './notes.vue'
    import questions from './questions.vue'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        components: {
            'contacts': contacts,
            'videos': video,
            'notes': notes,
            'questions': questions
        },
        props: ['videos'],
        computed:{
            currentDay: function(){
                return this.$store.state.user.current_day;
            },
            videoList: function() {
                var temp = []
                for(var x in this.videos){
                    if(this.videos[x].day === this.currentDay){
                        temp.push({'url': this.videos[x].video, 'charID': this.videos[x].character_ID});
                    }
                }
                return temp;
            },
            questionsList: function() {
                var temp = []
                for(var x in this.videos){
                    if(this.videos[x].day === this.currentDay){
                        temp.push({'charID': this.videos[x].character_ID,'question': this.videos[x].question, 'start': this.videos[x].video_startTime, 'end': this.videos[x].video_endTime});
                    }
                }
                return temp;
            },
            contactsList: function() {
                var temp = [];
                for (var x in this.videos) {
                    temp.push({
                        charID: this.videos[x].character_ID,
                        day: this.videos[x].day,
                    });
                }
                //sort array of objects to prevent duplicates from being passed
                var result = temp.filter(function (a) {
                    return !this[a.charID] && (this[a.charID] = true);
                }, Object.create(null));

                return result;
            }
        },
        methods: {

        }
    }
</script>