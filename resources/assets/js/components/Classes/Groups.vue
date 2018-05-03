<template>
    <div id="groups">
        <h2>Group Students</h2>
        <table class="table">
            <thead>
            <tr>
                <th>Group</th>
                <th>Students</th>
                <th>Manage</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="group in groups">
                <td>{{ group.name }}</td>
                <td>
                    <ul>
                        <li v-for="student in group.students" :key="student.id">
                            {{ student.name }} <button class="btn btn-sm btn-danger" @click="removeStudent(student, group.group_id, clss.class_id)">x</button>
                        </li>
                        <li>
                            <v-select v-model="newGroupUser" label="name" :options="unassigned"></v-select>
                            <button class="btn btn-success" @click="addStudent(clss.class_id, group.group_id)">
                                Add Student
                            </button>
                        </li>
                    </ul>
                </td>
                <td>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="button" class="btn btn-danger">Delete Group</button>
                        <!--<button type="button" class="btn btn-secondary">Right</button>-->
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <button class="btn btn-primary">
                        New Group
                    </button>
                </td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'
    import  vSelect  from 'vue-select'

    export default {
        props: ['groups', 'unassigned'],
        components: {
            'v-select': vSelect
        },
        mounted() {
            console.log('Component mounted.')
        },
        data: function () {
            return {
                newGroupUser: ''
            }
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




            }
        }
    }
</script>
