<template>
    <div id="right-menu">
        <a href="/library"><img src="/img/right-menu/library.png" alt="library"></a>
        <a href="/gallery"><img src="/img/right-menu/gallery.png" alt="gallery"></a>
        <a href="/videocall"><img src="/img/right-menu/chat.png" alt="chat"></a>
        <a href="/email"><img src="/img/right-menu/msg.png" alt="msg"></a>
    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'

    export default {

        mounted() {
//            console.log('Component mounted.')
        },
        methods: mapActions([
            'toggleTask'
        ])
    }
</script>

<style scoped>
    #right-menu {
        z-index: 1000;
        position: fixed;
        top: 30%;
        right: 0;
        min-width: 80px;
        max-width: 80px;
        height: 320px;
        background-color: white;
        box-shadow: 2px 1px 2px;

    }
</style>