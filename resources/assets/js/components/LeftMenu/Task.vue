<template>
    <li>
        <label>
            <input v-if="complete" type="checkbox" checked v-on:click="toggleTask(task.task_id)">
            <input v-else type="checkbox" v-on:click="toggleTask(task.task_id)">
            <span class="checkmark"></span>
            {{ task.title }}
        </label>
    </li>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'

    export default {
        props: ['task', 'complete'],
        mounted() {

        },
        data: function () {
            return {
                taskComplete: this.complete
            }
        },
        methods: mapActions([
            'toggleTask'
        ])
    }
</script>

<style scoped lang="scss">
    @import "../../../sass/_variables.scss";

    li {
        margin-top: 10px;
        margin-bottom: 12px;
    }

    label {
        display: block;
        position: relative;
        padding-left: 28px;
        margin-top: 11px;
        margin-bottom: 12px;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    /* Hide the browser's default checkbox */
    label input {
        position: absolute;
        opacity: 0;
        cursor: pointer;
    }

    /* Create a custom checkbox */
    .checkmark {
        position: absolute;
        top: 4px;
        left: 0;
        height: 16px;
        width: 16px;
        background-color: #eee;
        border: 1px solid $sim-heading;
    }

    /* On mouse-over, add a grey background color */
    label:hover input ~ .checkmark {
        background-color: #ccc;
    }

    /* When the checkbox is checked, add a blue background */
    label input:checked ~ .checkmark {
        background-color: #ABDBFB;
        background: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/9487/icon-check.svg") no-repeat center center;
    }

    /* Create the checkmark/indicator (hidden when not checked) */
    .checkmark:after {
        content: "";
        position: absolute;
        display: none;
    }

    /* Show the checkmark when checked */
    label input:checked ~ .checkmark:after {
        display: block;
    }

    /* Style the checkmark/indicator */
    /*label .checkmark:after {*/
        /*left: 9px;*/
        /*top: 5px;*/
        /*width: 5px;*/
        /*height: 10px;*/
        /*border: solid white;*/
        /*border-width: 0 3px 3px 0;*/
        /*-webkit-transform: rotate(45deg);*/
        /*-ms-transform: rotate(45deg);*/
        /*transform: rotate(45deg);*/
    /*}*/
</style>