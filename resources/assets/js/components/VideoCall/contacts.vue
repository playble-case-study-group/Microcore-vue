<template>
    <div class="'container">
    <videos :video="this.video" :active="this.chosenContact" :question="this.qID" ></videos>
        <div id="contacts">
        <div class="contact-inner"
             :id="person.charID"
             v-for="person in idList"
             v-on:click="chosenContact = (person.charID)">
                <img id="photo" src=""><br>
                <span id="name">John Smith</span><br>
                <span id="position">Data Influencer</span>
                <span v-if="activeContacts.includes(person.charID)">    ACTIVE</span><br>
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
                qID: 0
            }
        },
        props: ['contacts', 'video', 'questions'],
        components: {
            'videos': video,
            'questions': questions
        },
        computed: {
            activeContacts: function() {
                let contacts = this.contacts.filter((contact) => {
                    if(contact.day === this.$store.state.user.current_day){
                        return contact.charID;
                    }
                })
                    .map((contact) => {
                        return contact.charID;
                    })
                return contacts;
            },
            idList: function() {
                //sort array of objects to prevent duplicates from being passed
                let result = this.contacts.filter(function (a) {
                    return !this[a.charID] && (this[a.charID] = true);
                }, Object.create(null));
                return result;
            }
        },
        methods:{
            play: function(id) {
                this.qID =  id;
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


</style>