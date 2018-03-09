<template>
    <div class="'container">
    <videos :video="this.video" :active="this.chosenContact" :vid_start="this.start" :vid_end="this.end" ></videos>
        <div id="contacts">
        <div class="contact-inner"
             v-for="person in this.contacts"
             :id="person.id"
             v-on:click="chosenContact = (person.id)">
                <img id="photo" src=""><br>
                <span id="name">{{person.name}}</span><br>
                <span id="position">{{person.role}}</span>
                <span v-if="activeContacts.includes(person.id)"><i id="active" class="material-icons">fiber_manual_record</i></span><br>
        </div>
    </div>
    <questions v-on:vPlay="play" :questions="this.questions" :active="this.chosenContact"></questions>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import questions from './questions.vue'
    import video from './videos.vue'

    export default {

        mounted() {
        },
        data: function(){
            return {
                chosenContact: 0,
                start: 0,
                end: 0
            }
        },
        props: ['contacts_info','contacts', 'video', 'questions'],
        components: {
            'videos': video,
            'questions': questions
        },
        computed: {
            activeContacts: function() {
                let contacts = this.contacts_info.filter((contact) => {
                    if(contact.day === this.$store.state.user.current_day){
                        return contact.charID;
                    }
                })
                    .map((contact) => {
                        return contact.charID;
                    })
                return contacts;
            }
        },
        methods:{
            play: function(start, end) {
                this.start =  start;
                this.end = end;
            },
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