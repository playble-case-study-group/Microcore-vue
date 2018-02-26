<template>
    <div id="question">
        <div class="single-question"
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
        },
        props: ['question', 'active'],
        methods: mapActions([
        ])
    }
</script>

<style scoped>
    .content {
        padding: 20px;
    }

    #question {

    }

</style>