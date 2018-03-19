<template>
    <div id="videocall" class="container">
        <div class="row">
            <notes id="notesParent"  class="col-md-12 col-lg-4 order-sm-12" :notes="this.notes"></notes>
            <contacts id="contactsParent" class="col-md-12 col-lg-8 order-sm-1"
                :contacts="this.contacts"
                :calls="this.calls"
                :questions="this.questions">
        </contacts>
        </div>
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
    }
    #notesParent{
        height:70rem;
    }
    #contactsParent{

    }

</style>