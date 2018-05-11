<template>
    <div id="assignments">
        <div class="row">
            <div class="col-sm-3">
                <label for="assignmentType" >Type</label>
                <select name="assignmentType"
                        class="custom-select"
                        id="assignmentType"
                        v-model="assignmentType">
                    <option value="email">Email</option>
                    <option value="gallery">Gallery</option>
                    <option value="videoCall">Video Call</option>
                </select>

            </div>
            <div class="col-sm-3">
                <label for="assignmentSelect">Assignment</label>
                <select name="assignmentSelect"
                        id="assignmentSelect"
                        v-model="curAssignment"
                        class="custom-select">
                    <option v-for="assignment in assignmentList" :value="assignment">
                        {{ assignment.title }}
                    </option>
                </select>
            </div>
            <div class="col-sm-6">
                <div class="dropdown float-right">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Download
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        data: function () {
            return {
                assignmentType: '',
                assignmentList: [],
                curAssignment: {}
            }
        },
        watch: {
            assignmentType: function () {
                console.log(this.assignmentType)
            }
        },
        methods: mapActions([
            'toggleTask'
        ])
    }
</script>
