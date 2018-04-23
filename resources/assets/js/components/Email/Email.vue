<template>
    <div class="container">
        <div class="row">
            <div class="heading col-sm-12">
                <h1>Messages</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2" style="background-color: #ffffff; height: 100vh">
                <button @click="composeModal">Compose</button>
                <ul>
                    <li @click="toggleInbox">Inbox</li>
                    <li @click="toggleSent">Sent</li>
                </ul>
            </div>
            <div class="col-sm-10">
                <table id="inbox">
                    <tr>
                        <th></th>
                        <th>From</th>
                        <th>Subject</th>
                        <th>Body</th>
                        <th>Date</th>
                        <th></th>
                    </tr>
                    <tr v-for="email in characterEmails"
                        @click="readEmail(email)"
                        :key="email.character_email_id">
                        <td>
                            <img :src="email.img_small" alt="">
                        </td>
                        <td>
                            {{ email.name }}
                        </td>
                        <td>
                            {{ email.subject }}
                        </td>
                        <td>
                            {{ email.body }}
                        </td>
                        <td>
                            {{ email.day }}
                        </td>
                        <td>

                        </td>
                    </tr>
                </table>
                <table id="sent">
                    <tr>
                        <th>To</th>
                        <th>Subject</th>
                        <th>Body</th>
                        <th>Day</th>
                        <th></th>
                    </tr>
                    <tr v-for="email in studentEmails"
                        @click="readEmail(email)"
                        :key="email.student_email_id">
                        <td>
                            {{ email.name }}
                        </td>
                        <td>
                            {{ email.subject }}
                        </td>
                        <td>
                            {{ email.body }}
                        </td>
                        <td>
                            {{ email.day }}
                        </td>
                        <td>

                        </td>
                    </tr>
                </table>
            </div>

        </div>

        <!-- Read Modal -->
        <div class="modal fade" id="readModal" tabindex="-1" role="dialog" aria-labelledby="readModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">{{ readModalData.subject }}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4><b>{{ readModalData.from }}</b></h4>
                        <p>{{ readModalData.body }}</p>
                        <button @click="replyEmail">Reply</button>
                        <div id="replyForm">
                            <div class="row form-group">
                                <label for="replySubject" class="col-sm-2">Subject:</label>
                                <input type="text" id="replySubject" name="replySubject" class="col-sm-10" v-model="draftEmail.subject">
                            </div>
                            <div class="row form-group">
                                <label for="replyBody">Body</label>
                                <textarea type="text" id="replyBody" v-model="draftEmail.body"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Compose Modal -->
        <div class="modal fade" id="composeModal" tabindex="-1" role="dialog" aria-labelledby="readModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4><b>Compose modal</b></h4>
                        <div class="row form-group">
                            <label for="toList" class="col-sm-2">To:</label>
                            <div class="col-sm-10">
                                <v-select :options="characters" label="name" v-model="draftEmail.to" id="toList">

                                </v-select>
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="toSubject" class="col-sm-2">Subject:</label>
                            <input type="text" id="toSubject" name="toSubject" class="col-sm-10" v-model="draftEmail.subject">
                        </div>
                        <div class="row form-group">
                            <label for="toBody">Body</label>
                            <textarea type="text" id="toBody" v-model="draftEmail.body"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button @click="sendEmail">Send</button>
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

        components: {
            'v-select': vSelect
        },
        data: function () {
            return {
                draftemailsubject: "",
                draftemailbody: "",
                toCharacter: "",
                readModalData: {
                    id: 0,
                    from: "",
                    subject: "",
                    body: ""
                },
                draftEmail: {
                    to: 0,
                    reply: 0,
                    subject: "",
                    body: ""
                }

            }
        },
        props: ['characterEmails', 'characters', 'studentEmails'],
        mounted() {
            console.log('Component mounted.');
            $('#sent').hide();
            $('#replyForm').hide();

        },
        methods: {
            sendemail: function () {
                axios.post('/email', {subject: this.draftemailsubject, body: this.draftemailbody})
                    .then( response => {
                    console.log(response);
                    this.emails.push(response.data);
                })
            },
            readEmail: function (email) {
                this.resetDraftEmail();
                this.readModalData.id = email.character_email_id;
                this.readModalData.from = email.name;
                this.readModalData.subject = email.subject;
                this.readModalData.body = email.body;

                $('#readModal').modal();
                console.log(email)
            },
            toggleInbox: function () {
                $('#inbox').show();
                $('#sent').hide();
                console.log('inbox');
            },
            toggleSent: function () {
                $('#inbox').hide();
                $('#sent').show();
                console.log('sent');
            },
            composeModal: function () {
                this.resetDraftEmail();

                $('#composeModal').modal('show');
            },
            sendEmail: function () {
                axios.post('/email', this.draftEmail).then( response => {
                    console.log(response.data)

                    this.resetDraftEmail();
                });
            },
            replyEmail: function () {

                this.draftEmail.reply = this.readModalData.id;

                $('#replyForm').show();
            },
            resetDraftEmail: function () {
                // Reset the draft email
                this.draftEmail = {
                    to: 0,
                    reply: 0,
                    subject: "",
                    body: ""
                };
            }
        }

    }
</script>

<style scoped lang="scss">
    @import "../../../sass/_variables.scss";

    .container {
        margin-left: 40px;
        margin-top: 40px;
        padding: 0;
        /*padding: 20px;*/
        background-color: white;

    }

    .heading {
        background-color: $sim-heading;
        height: 40px;
        color: white;

        h1 {
            margin: 0;
            padding: 8px 10px;
        }

    }

    ul {
        padding-left: 0;
        list-style: none;
    }

    td, th {
        padding: 10px;
    }
</style>
