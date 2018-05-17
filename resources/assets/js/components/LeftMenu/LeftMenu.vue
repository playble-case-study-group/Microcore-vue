<template>

    <div id="left-menu">
        <div class="content">
            <user-progress v-bind:tasks="tasks">
            </user-progress>
            <user-tasks>
            </user-tasks>
            <div id="next-day">
                <button type="button" class="btn btn-invert" data-toggle="modal" data-target="#exampleModal"><i class="material-icons">keyboard_arrow_left</i></button>
                <button type="button" class="btn btn-invert" v-on:click="NEXT_DAY()">NEXT DAY <i class="material-icons">keyboard_arrow_right</i></button>
            </div>
            <br>
            <br>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Reset Current Day?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            This function will reset your current day. All work you have done on this day will be lost.
                            <br><br>

                            <strong><em>Are you sure you wish to continue?</em></strong>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" @click="resetDay">Continue</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">No, thank you</button>
                        </div>
                    </div>
                </div>
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
                tasks: [],

            }
        },
        mounted() {

        },
        methods: {
            ...mapActions([
                'NEXT_DAY',
                'PREVIOUS_DAY'
            ]),
            resetDay: function() {
                this.PREVIOUS_DAY();
            }
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
        /*box-shadow: inset -7px 0 9px -10px rgba(0,0,0,0.4);*/
        box-shadow: 0px -6px 10px;
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