<template>
    <div id="user-tasks">
        <h1>Tasks</h1>
        <ul>
            <user-task v-for="task in CURRENT_TASKS" v-bind:task="task" v-bind:complete="task.complete" v-bind:key="task.task_id"></user-task>

        </ul>
        <hr>
    </div>
</template>

<script>
    import Task from './Task.vue'
    import { mapGetters } from 'vuex'

    export default {
        components: {
            'user-task': Task
        },
        props: ['tasks', 'user'],
        mounted() {

        },
        computed: {
            ...mapGetters([
                'CURRENT_TASKS'
            ])
        },
        data: function () {
            return {

            }
        },
        methods: {

        }
    }
</script>

<style scoped>
    ul {
        list-style: none;
        padding-left: 0;
    }

</style>
