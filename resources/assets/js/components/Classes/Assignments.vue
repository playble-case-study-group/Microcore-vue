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
                    <span slot="img" slot-scope="props"><img :src="props.row.img" alt=""></span>
                    <span slot="day" slot-scope="props">{{ props.row.u_name }}</span>
                    <span slot="changes" slot-scope="props">
                        <h4>{{ props.row.title }}</h4>
                        <p>{{ props.row.description }}</p>
                        <ul>
                            <li v-for="tag in props.row.tags">{{ tag.title }}</li>
                        </ul>
                    </span>
                    <span slot="response" slot-scope="props">
                        <video controls>
                            <source :src="props.row.response" type="video/webm">
                            I'm sorry; your browser doesn't support HTML5 video in WebM with VP8/VP9 or MP4 with H.264.
                        </video>
                    </span>
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
                tableOptions: {
                    headings: {},
                    sortable: []
                },
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
                // Clear table data
                this.tableData = [];

                // Clear Assignment list
                this.assignmentList = [];

                // Reset table columns to assignment type
                let table_columns =  JSON.parse(this.assignmentType.table_columns);
                this.tableColumns = table_columns.columns;

                // Manage table options
                this.tableOptions.headings = table_columns.headings;
                this.tableOptions.sortable = table_columns.sortable;

                // Retrieves assignments according to type.
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
