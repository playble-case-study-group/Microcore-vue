<template>
    <div id="video">
        <video>
            <source src="" type="video/mp4">
        </video>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        props: ['video'],
        computed:{
            videourl: function(){
                return this.video.url;
            }

        },
        methods: {

        }
    }
</script>