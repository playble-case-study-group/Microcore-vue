<template>

    <div id="left-menu">
        <div class="content">
            <user-progress v-bind:tasks="tasks">
            </user-progress>
            <user-tasks>
            </user-tasks>
            <div id="next-day">
                <button type="button" class="btn btn-invert" v-on:click="PREVIOUS_DAY()"><i class="material-icons">keyboard_arrow_left</i></button>
                <button type="button" class="btn btn-invert" v-on:click="NEXT_DAY()">NEXT DAY <i class="material-icons">keyboard_arrow_right</i></button>
            </div>
        </div>
    </div>
</template>

<script>
    import Progress from './Progress.vue';
    import Tasks from './Tasks.vue';
    import Counter from '../Counter.vue';
    import {mapActions} from 'vuex';

    export default {
        components: {
            'user-progress': Progress,
            'user-tasks': Tasks,
            'counter': Counter
        },
        props: ['user'],
        data: function () {
            return {
                tasks: []
            }
        },
        mounted() {

        },
        methods: {
            ...mapActions([
                'NEXT_DAY',
                'PREVIOUS_DAY'
            ])
        }

    }

</script>

<style scoped>
    #left-menu {
        min-width: 193px;
        max-width: 240px;
        min-height: 100vh;
        background-color: white;
        /*box-shadow: 2px 1px 2px;*/
        box-shadow: inset -7px 0 9px -10px rgba(0,0,0,0.4);
        /*-webkit-box-shadow: 0 8px 6px -6px #999;*/
        /*-moz-box-shadow: 0 8px 6px -6px #999;*/
        /*box-shadow: 0 8px 6px -6px #999;*/
    }
    .content {
        padding: 20px;
    }

    ul {
        list-style: none;
        padding-left: 0 !important;
    }
    @media(min-width: 1024px){
        #left-menu{
            min-width: 240px;
        }
    }

</style>