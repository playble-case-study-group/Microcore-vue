<template>
    <div id="contacts">

        <h1>Contact List</h1>
            <contact :contact="contacts" :activeContacts="activeContacts"></contact>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import contact from './contact.vue'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        props: ['contacts'],
        components: {
            'contact': contact,

        },
        computed: {
            activeContacts: function() {
                var temp = [];
                for(var contact in this.contacts){
                    if(this.contacts[contact].day === this.$store.state.user.current_day){
                        temp.push(this.contacts[contact].charID);
                    }
                }
                return temp;
            }

        }
    }
</script>