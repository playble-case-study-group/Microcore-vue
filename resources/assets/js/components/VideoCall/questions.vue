<template>
    <div id="questions">
        <question></question>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import question from './question.vue'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        props: ['questions'],
        components: {
            'question': question,

        },
        methods: {

        }
    }
</script>