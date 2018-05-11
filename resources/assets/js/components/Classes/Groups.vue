<template>
    <div id="groups">
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
                            {{ student.name }} <button class="btn btn-sm btn-danger" @click="removeStudent(student, group.group_id)">x</button>
                        </li>
                        <li>
                            <v-select v-model="newGroupUser" label="name" :options="unassigned"></v-select>
                            <button class="btn btn-success" @click="addStudent(group.group_id)">
                                Add Student
                            </button>
                        </li>
                    </ul>
                </td>
                <td>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="button"
                                data-toggle="modal"
                                data-target="#deleteGroupModal"
                                @click="changeDeleteId(group.group_id)"
                                class="btn btn-danger">
                            Delete Group
                        </button>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <button type="button"
                            data-toggle="modal"
                            data-target="#newGroupModal"
                            class="btn btn-primary">
                        New Group
                    </button>
                </td>
                <td></td>
            </tr>
            </tbody>
        </table>

        <div class="modal fade" id="newGroupModal" tabindex="-1" role="dialog" aria-labelledby="newGroupModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="newModalLongTitle">New Group</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="groupName">Name</label>
                            <input type="text"
                                   id="groupName"
                                   class="form-control"
                                   v-model="newGroupName"
                                   placeholder="Add group name">
                        </div>
                        <button class="btn btn-success" type="button" @click="createGroup">Create Group</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="deleteGroupModal" tabindex="-1" role="dialog" aria-labelledby="deleteGroupModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLongTitle">Delete Group</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>By Pressing Delete you will delete this group and all student group work within it.  Are you sure you want to proceed?</p>
                        <button class="btn btn-danger" type="button" @click="deleteGroup(deleteGroupId)">Delete Group</button>
                        <button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'
    import  vSelect  from 'vue-select'

    export default {
        props: ['groups', 'unassigned', 'classId'],
        components: {
            'v-select': vSelect
        },
        mounted() {
            console.log('Component mounted.')
        },
        data: function () {
            return {
                newGroupUser: '',
                newGroupName: '',
                deleteGroupId: 0
            }
        },
        watch: {

        },
        methods: {

            createGroup: function () {
                console.log('create group');
                let exists = _.find(this.groups, {'name': this.newGroupName});
                if (exists) {
                    alert('group with this name already exists');
                } else {
                    let data = {
                        classId: this.classId,
                        name: this.newGroupName
                    };

                    axios.post('/group', data).then( response => {
                        let newGroup = {
                            group_id: response.data,
                            name: this.newGroupName,
                            students: []
                        };

                        this.groups.push(newGroup);

                        $('#newGroupModal').modal('hide')
                    })
                }
            },
            changeDeleteId: function (groupId) {
                this.deleteGroupId = groupId;
                this.$forceUpdate();
            },
            deleteGroup: function (groupId) {

                let data = {
                    _method: 'delete'
                };

                axios.post('/group/' + groupId, data).then( response => {
                    console.log(response.data);
                    _.remove(this.groups, {'group_id': groupId});
                    $('#deleteGroupModal').modal('hide');
                    this.$forceUpdate();
                });
            },
            addStudent: function (groupId) {
                if (this.newGroupUser) {

                    let group = _.find(this.groups, {'group_id': groupId});

                    console.log(group);

                    // If user is already in a group
                    if (!this.unassigned.includes(this.newGroupUser)) {
                        alert('Student is already in a group.');
                    } else {
                        let data = {
                            'groupId': groupId,
                            'userId': this.newGroupUser.id
                        };

                        axios.post('/addToGroup', data).then( response => {
                            group.students.push(this.newGroupUser);
                            _.remove(this.unassigned, this.newGroupUser);
                            console.log('posting');
                            this.newGroupUser = "";

                        })
                    }



                }
            },
            removeStudent: function (student, groupId) {
                let group = _.find(this.groups, {'group_id': groupId});
                let data = {
                    userId: student.id,
                    groupId: group.group_id
                };

                axios.post('/removeFromGroup', data).then( response => {
                    group.students.splice(_.findIndex(group.students, student), 1);
                    this.unassigned.push(student);
                    this.$forceUpdate();
                });

            }
        }
    }
</script>
