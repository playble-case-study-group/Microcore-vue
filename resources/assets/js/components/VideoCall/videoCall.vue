<template>
    <div id="videocall" class="container">
        <notes id="notes" :notes="this.notes"></notes>
        <contacts id="contacts"
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
        display: flex;
        flex-direction: row;

    }
    #notes{

    }
    #contacts{

    }

</style>