<template>
    <div id="question">

        <h1>This is an Question </h1>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'


    export default {

        mounted() {
            console.log('Component mounted.')
        },

        methods: mapActions([
        ])
    }
</script>