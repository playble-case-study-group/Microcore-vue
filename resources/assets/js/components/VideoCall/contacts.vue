<template>
    <div id="contacts">

        <h1>Contact List</h1>
        <div>
            <contact :contact="contacts"></contact>
        </div>
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
        methods: {

        }
    }
</script>