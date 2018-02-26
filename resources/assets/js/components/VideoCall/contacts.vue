<template>
    <div class="'container">
    <videos :video="this.video" :active="this.chosenContact"></videos>
        <div id="contacts">
        <div class="contact-inner"
             :id="person.charID"
             v-for="person in contacts"
             v-on:click="chosenContact = (person.charID)">
                <span id="name">Cool-guy McFly</span><br>
                <span id="position">Data Influencer</span><br>
                <img id="photo" src="">
                <span v-if="activeContacts.includes(person.charID)">ACT IVE</span><br>
        </div>
    </div>
    <questions :questions="this.questions" :active="this.chosenContact"></questions>
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
                chosenContact: 0
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
            }

        }
    }
</script>