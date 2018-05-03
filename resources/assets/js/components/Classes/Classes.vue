<template>
    <div class="container" style="margin-right: 100px">
        <div class="row">
            <div class="col-sm-12">
                <h1>Classes</h1>

                <ul class="nav nav-tabs" id="classTab" role="tablist">
                    <li class="nav-item"
                        v-for="(clss, index) in classes"
                        :key="clss.class_id">
                        <a class="nav-link active"
                           :id="clss.class_id + '-tab'"
                           data-toggle="tab"
                           :href="'#' + clss.class_id"
                           role="tab"
                           :aria-controls="clss.name"
                           aria-selected="true">
                            {{ clss.name }}
                        </a>
                    </li>
                </ul>
                <div class="tab-content" id="classTabContent">
                    <div v-for="(clss, index) in classes"
                         class="tab-pane fade show active"
                         :id="clss.class_id"
                         :key="clss.class_id"
                         role="tabpanel"
                         :aria-labelledby="clss.name + '-tab'">

                        <h2>Students</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Day</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="student in clss.students">
                                    <td>{{ student.name }}</td>
                                    <td>{{ student.email }}</td>
                                    <td>{{ student.current_day }}</td>
                                </tr>
                            </tbody>
                        </table>

                        <groups :groups="clss.groups" :unassigned="clss.unAssigned"></groups>
                    </div>

                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'
    import groups from './Groups.vue'

    export default {

        props: ['classes'],
        components: {
            'groups': groups
        },
        data: function () {
            return {
                newGroupUser: "",
                curClass: {},
                curUnassigned: [],
                curGroupMembers: [],
            }
        },
        mounted() {
            console.log('Component mounted.')

        },
        methods: {
            addStudent: function (classId, groupId) {
                if (this.newGroupUser) {
                    // Get class.
                    let clss = this.getClass(classId);

                    // Get group and see if the student is there already.
                    let group = this.getGroup(clss, groupId);

                    // If user is already in a group
                    if (!clss.unAssigned.includes(this.newGroupUser)) {
                        alert('Student is already in a group.');
                    } else {
                        let data = {
                            'groupId': groupId,
                            'userId': this.newGroupUser.id
                        };

                        axios.post('/addToGroup', data).then( response => {
                            group.students.push(this.newGroupUser);
                            _.remove(clss.unAssigned, this.newGroupUser);
                            console.log('posting');
                            this.newGroupUser = "";

                        })
                    }



                }
            },
            removeStudent: function (student, groupId, classId) {
                let clss = this.getClass(classId);
                let group = this.getGroup(clss, groupId);
                let data = {
                    _method: 'delete',
                    userId: student.id,
                    groupId: group.group_id
                };

                axios.post('/group/' + group.group_id, data).then( response => {
                    group.students.splice(_.findIndex(group.students, student), 1);
                    clss.unAssigned.push(student);
                    this.$forceUpdate();
                });




            },
            getGroup: function (clss, groupId) {
                return _.find(clss.groups, {'group_id': groupId});
            },
            getClass: function (classId) {
                return _.find(this.classes, {'class_id': classId});
            }
        }
    }
</script>