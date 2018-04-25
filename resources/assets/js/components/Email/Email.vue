<template>
    <div class="container main">
        <div class="row">
            <div class="heading col-sm-12">
                <h1>Messages</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2" style="background-color: #c8c8c8; height: 111rem">
                <button class="btn btn-success compose" @click="composeModal">Compose</button>
                <ul>
                    <li class="inboxToggle" style="background-color: white;" @click="toggleInbox">Inbox</li>
                    <li class="sentToggle" @click="toggleSent">Sent</li>
                </ul>
            </div>
            <div class="col-sm-10 emailList">
                <table id="inbox">
                    <tr>
                        <th>From</th>
                        <th></th>
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
                    <div class="modal-header heading">
                        <h5 class="modal-title">{{ readModalData.subject }}</h5>
                    </div>
                    <div class="modal-body">
                        <h5><b>{{ readModalData.from }}</b></h5>
                        <p class="email-body">{{ readModalData.body }}</p>
                        <div id="replyForm">
                            <div class="row form-group reply-contact">
                                <i class="material-icons reply">reply</i>
                                <span class="reply-contact-name">{{ readModalData.from }}</span>
                            </div>
                            <div class="row form-group">
                                <textarea class="col-sm-12" type="text" id="replyBody" v-model="draftEmail.body"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success replyEmail" @click="replyEmail">Reply</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Compose Modal -->
        <div class="modal fade" id="composeModal" tabindex="-1" role="dialog" aria-labelledby="readModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header heading">
                        <h5 class="modal-title">New Email</h5>
                    </div>
                    <div class="modal-body">
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
                            <textarea class="col-sm-12" type="text" id="toBody" v-model="draftEmail.body"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success" @click="sendEmail">Send</button>
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
                $('.inboxToggle').css('background-color', 'white');
                $('.sentToggle').css('background-color', '#c8c8c8');
                $('#sent').hide();
                console.log('inbox');
            },
            toggleSent: function () {
                $('#inbox').hide();
                $('.sentToggle').css('background-color', 'white');
                $('.inboxToggle').css('background-color', '#c8c8c8');
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
                $('.replyEmail').html('Send');
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
    ul {
        padding-left: 0;
        list-style: none;
        cursor: pointer;
        margin-top: 20px;
    }
    li {
        height: 40px;
        margin-left: -10px;
        margin-right: -10px;
        padding: 10px 28px;
    }
    textarea{
        resize: none;
        height: 20rem;
    }
    .main{
        height: 115rem;
    }
    td, th {
        padding: 10px;
    }
    .emailList{
        margin-top: 20px;
    }
    .compose{
        margin-top: 20px;
        margin-left: 17px;
    }
    #toBody{
        height: 20rem;
        resize: none;
    }
    .email-body{
        margin: 20px 0 40px;
    }
    .reply{
        font-size: 25px;
    }
    .reply-contact{
        border: solid 1px;
        border-bottom: 0;
        margin-bottom: 0;
    }
    .reply-contact-name{
        padding-top: 9px;
        padding-left: 7px;
        position: absolute;
        height: 20px;
    }
</style>
