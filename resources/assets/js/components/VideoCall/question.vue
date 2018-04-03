<template>
    <div id="question">
        <br>
        <button class="single-question"
             v-for="single in question"
             :id="single.id"
             v-on:click="play(single.start, single.end)">
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
            play: function (start, end) {
                this.$emit('play', start, end);
            }

        }
    }
</script>

<style scoped>
    button {
        padding: 20px;
        background-color: #2ab27b;
        color: white;
        border: none;
    }
    button:hover {
        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.24), 0 6px 20px 0 rgba(0,0,0,0.19);
    }

    #question {

    }

</style>