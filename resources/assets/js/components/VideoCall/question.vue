<template>
    <div id="question">
        <div class="question"
             v-for="single in question"
             v-on:click="">
            {{ single.question }}
        </div>


    </div>
</template>

<script>
    import { mapActions } from 'vuex'


    export default {

        mounted() {
            console.log('Component mounted.')
        },
        props: ['question', 'active'],
        methods: mapActions([
        ])
    }
</script>