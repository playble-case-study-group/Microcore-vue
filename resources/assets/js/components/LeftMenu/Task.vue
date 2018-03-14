<template>
    <li>
        <label>
            <input v-if="complete" type="checkbox" checked v-on:click="toggleTask(task.id)">
            <input v-else type="checkbox" v-on:click="toggleTask(task.id)">
            <span class="checkmark"></span>
            {{ task.title }}
        </label>
        <!--<img v-if="complete"-->
             <!--v-on:click="check(task.id)"-->
             <!--src="/img/checked.svg"-->
             <!--alt="complete">-->
        <!--<img v-else-->
             <!--v-on:click="check(task.id)"-->
             <!--src="/img/unchecked.svg"-->
             <!--alt="incomplete">-->
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
//            {
//            check: function (id) {
//                this.taskComplete = !this.taskComplete;
////                axios.post('/tasks/complete',{id: id, complete: this.taskComplete})
////                    .then((response)=>{
//////                        console.log(response)
////                    }).catch((error)=>{
//////                    console.log(error.response.data)
////                })
//            }
//        }
    }
</script>

<style scoped>
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
        top: 0;
        left: 0;
        height: 16px;
        width: 16px;
        background-color: #eee;
        border: 3px solid #4A4A4A;
    }

    /* On mouse-over, add a grey background color */
    label:hover input ~ .checkmark {
        background-color: #ccc;
    }

    /* When the checkbox is checked, add a blue background */
    label input:checked ~ .checkmark {
        background-color: #4A4A4A;
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