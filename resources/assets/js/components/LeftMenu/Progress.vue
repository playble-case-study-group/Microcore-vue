<template>
    <div id="user-progress">
        <h1>Progress</h1>
        <ul>
            <li v-for="day in TASKS_BY_DAY">
                <img :src="'/img/days/day-' + day[0].day + '.png'" alt="day" class="day">
                <span v-for="task in day"
                      v-if="task.complete"
                      class="task">
<<<<<<< HEAD
                    <img src="/img/complete-orange.png" alt="complete">
=======
                    <img src="/img/complete-blue.png" alt="complete">
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6
                </span>
                <span v-for="task in day"
                      v-if="!task.complete"
                      class="task">
<<<<<<< HEAD
                    <img src="/img/incomplete-orange.png" alt="incomplete">
=======
                    <img src="/img/incomplete-blue.png" alt="incomplete">
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6
                </span>
            </li>
        </ul>
        <hr>
    </div>
</template>

<script>
    import { mapGetters } from 'vuex'

    export default {
        mounted() {

        },
        computed: {
            ...mapGetters([
                'TASKS_BY_DAY'
            ])
        }
    }
</script>

<style scoped>
    ul {
        list-style: none;
        padding-left: 0;
    }

    li {
        margin-top: 10px;
        margin-bottom: 12px;

    }

    .task, .day {
        margin-right: 10px;
    }

</style>