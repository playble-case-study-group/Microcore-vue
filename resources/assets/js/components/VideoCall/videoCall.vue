<template>
    <div id="videocall" class="container">
        <notes id="notesParent" :notes="this.notes"></notes>
        <contacts id="contactsParent"
                :contacts="this.contacts"
                :calls="this.calls"
                :questions="this.questions">
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
        props: ['calls', 'questions', 'notes', 'contacts'],
    }
</script>

<style scoped>
    #videocall{
        margin: 0px 20px;
        display: flex;
        flex-direction: column-reverse;
        justify-content: flex-end;
    }
    #notesParent{
       width: inherit;
    }
    #contactsParent{

    }
    @media (min-width: 992px){
        #videocall{
            flex-direction:row;
        }
        #notesParent{
            margin: 20px;
            width: 35%
        }
    }

</style>