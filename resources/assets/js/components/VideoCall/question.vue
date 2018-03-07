<template>
    <div id="question">
        <br>
        <button class="single-question"
             v-for="single in question"
             :id="single.id"
             v-on:click="play(single.id)">
            <b>{{ single.question }}</b>
        </button>


    </div>
</template>

<script>
    import { mapActions } from 'vuex'


    export default {

        mounted() {
        },
        props: ['question', 'active'],
        methods: {
            play: function (qId) {
                this.$emit('play', qId);
            }

        }
    }
</script>

<style scoped>
    .content {
        padding: 20px;
    }

    #question {

    }

</style>