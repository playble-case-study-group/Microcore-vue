<template>
    <div class="container" style="margin-right: 100px">
        <div class="row">
            <div class="col-sm-12">
                <h1>Classes</h1>

                <select v-model="curClass" class="custom-select">
                    <option disabled value="">Please select a class</option>
                    <option v-for="(clss, index) in classes"
                            :key="index"
                            :selected="(index === 0 ? 'selected' : false)"
                            :value="clss">
                        {{ clss.name }}
                    </option>
                </select>

                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item active">
                        <a href="#students"
                           data-toggle="tab"
                           role="tab"
                           class="nav-link active">
                            Students
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#groups"
                           data-toggle="tab"
                           role="tab"
                           class="nav-link">
                            Groups
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#assignments"
                           data-toggle="tab"
                           role="tab"
                           class="nav-link">
                            Assignments
                        </a>
                    </li>
                </ul>

                <div class="tab-content" id="classTabContent">
                    <div id="students"
                         class="tab-pane fade show active"
                         role="tabpanel">
                        <students :students="curClass.students"></students>
                    </div>
                    <div id="groups"
                         class="tab-pane fade show"
                         role="tabpanel">
                        <groups :groups="curClass.groups"
                                :classId="curClass.class_id"
                                :unassigned="curClass.unAssigned"></groups>
                    </div>
                    <div id="assignments"
                         class="tab-pane fade show"
                         role="tabpanel">
                        <assignments :assignment-types="assignmentTypes" :class-id="curClass.class_id"></assignments>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'
    import groups from './Groups.vue'
    import students from './Students.vue'
    import assignments from './Assignments.vue'

    export default {

        props: ['classes', 'assignmentTypes'],
        components: {
            'groups': groups,
            'students': students,
            'assignments': assignments
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
            changeCurrentClass: function (classId) {
                this.curClass = _.find(this.classes, {'class_id': classId});
            },
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