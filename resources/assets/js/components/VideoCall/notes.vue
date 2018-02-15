<template>
    <div id="notes">

        <h1>This is a Note</h1>
        <textarea rows="5" cols="50"></textarea>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        methods: {

        }
    }
</script>