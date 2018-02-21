<template>
    <div id="gallery" class="container">

        <h1>Welcome to the Gallery</h1>
        <artifact></artifact>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import artifact from './Artifact.vue'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        components: {
            'artifact': artifact
        },
        methods: mapActions([
        ])
    }
</script>