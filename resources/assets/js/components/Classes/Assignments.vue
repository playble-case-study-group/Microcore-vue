<template>
    <div id="assignments">
        <div class="row">
            <div class="col-sm-3">
                <label for="assignmentType" >Type</label>
                <select name="assignmentType"
                        class="custom-select"
                        id="assignmentType"
                        v-model="assignmentType">
                    <option v-for="(type, key) in assignmentTypes"
                            v-model="assignmentType"
                            :value="type"
                            :key="key">
                        {{ type.title }}
                    </option>
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
        <div class="row">
            <div class="col-sm-12">
                <v-client-table :data="tableData" :columns="tableColumns" :options="tableOptions">
                    <span slot="day" slot-scope="props">{{ props.row.u_name }}</span>
                </v-client-table>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'
    import {ClientTable} from 'vue-tables-2'

    export default {

        components: {
            'v-client-table': ClientTable.install(Vue, {}, false, 'bootstrap4')
        },
        props: ['assignmentTypes', 'classId'],
        mounted() {

        },
        data: function () {
            return {
                assignmentType: {},
                assignmentList: [],
                curAssignment: {},
                tableData: [],
                tableColumns: [],
                tableOptions: {},
                test: {
                    columns: ['id', 'name', 'age'],
                    tableData: [
                        { id: 1, name: "John", age: "20" },
                        { id: 2, name: "Jane", age: "24" },
                        { id: 3, name: "Susan", age: "16" },
                        { id: 4, name: "Chris", age: "55" },
                        { id: 5, name: "Dan", age: "40" }
                    ],
                    options: {
                        // see the options API
                    }
                }
            }
        },
        watch: {
            assignmentType: function () {
                this.tableColumns = JSON.parse(this.assignmentType.table_columns);
                axios.get('/assignments/' + this.assignmentType.assign_type_id).then( response => {
                    this.assignmentList = response.data;
                });
            },
            curAssignment: function () {


                let data = {
                    assignId: this.curAssignment.assign_id,
                    classId: this.classId
                };

                axios.post('/retrieveassignments', data).then( response => {
                    this.tableData = response.data;
                });
            }
        },
        methods: mapActions([
            'toggleTask'
        ])
    }
</script>
