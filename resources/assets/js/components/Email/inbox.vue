<template>
    <div class="inbox">
        <div class="row">
            <div class="col-sm-12 col-lg-10">
                <table id="inbox">
                    <tr>
                        <th>From</th>
                        <th></th>
                        <th>Subject</th>
                        <th>Day</th>
                        <th></th>
                    </tr>
                    <tr v-for="email in characterEmails"
                        @click="readEmail(email)"
                        :key="email.character_email_id">
                        <td> <img :src="email.img_small" alt=""> </td>
                        <td> {{ email.name }} </td>
                        <td class="truncate"> {{ email.subject }} - <span class="greyText">{{ email.body }}</span></td>
                        <td> {{ email.day }} </td>
                        <td> </td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- Read/Reply Modal -->
        <div class="modal fade" id="readModal" tabindex="-1" role="dialog" aria-labelledby="readModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header heading">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h5>
                            From: {{ readModalData.from }}
                        </h5>
                        <p>Subject: {{ readModalData.subject }}</p>
                        <p class="email-body">{{ readModalData.body }}</p>
                        <hr v-if="readModalData.reply">
                        <h5 v-if="this.readModalData.reply">
                            From: {{  this.$store.state.user.name }}
                        </h5>
                        <p v-if="this.readModalData.reply">Subject: {{ readModalData.subject }}</p>
                        <div class="email-body" v-if="this.readModalData.reply">{{ this.readModalData.reply.body }}</div>

                        <div class="replyForm" style="display: none;">
                            <div class="row form-group reply-contact col-sm-12">
                                <i class="material-icons reply">reply</i>
                                <span class="reply-contact-name">{{ readModalData.from }}</span>
                            </div>
                            <textarea class="col-sm-12" type="text" id="repBody" v-model="draftEmail.body"></textarea>
                        </div>

                    </div>
                    <div class="modal-footer" id="ReplyEmailId">
                        <button class="btn btn-success replyEmail" @click="replyEmail">Reply</button>
                        <button class="btn btn-success sendReplyEmail" style="display: none;" @click="sendReplyEmail(readModalData.character_email_id)">Send</button>
                    </div>
                </div>
            </div>
        </div>


    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'

    export default {
        data: function () {
            return {
                draftEmailSubject: "",
                draftEmailBody: "",
                toCharacter: "",
                readModalData: {
                    character_email_id: 0,
                    id: 0,
                    from: "",
                    subject: "",
                    body: "",
                    reply: ""
                },
                draftEmail: {
                    attachment: null,
                    character_email_id: 0,
                    to: 0,
                    reply: 0,
                    subject: "",
                    body: ""
                }
            }
        },
        props: {
            characterEmails: Array,
            characters: Array,
            studentEmails: Array
        },
        mounted() {
            $('#sent').hide();
            $('#replyForm').hide();
            let appScope = this;
            $('#readModal').on('hidden.bs.modal', function (e) {
                appScope.resetDraftEmail();
            })

        },
        methods: {
            readEmail: function (email) {
                this.resetDraftEmail();
                this.readModalData.id = email.character_email_id;
                this.readModalData.from = email.name;
                this.readModalData.subject = email.subject;
                this.readModalData.body = email.body;
                this.readModalData.reply = email.reply;
                this.readModalData.character_email_id = email.character_email_id;

                if (email.reply != null) {
                    //show player name and the email they wrote (using first()?) instead of reply button
                    $('#ReplyEmailId').hide();

                    console.log(this.$store.state.user.name);
                }
                else {
                    //show reply button
                    $('#ReplyEmailId').show();
                }

                $('#readModal').modal();
            },
            sendEmail: function (emailId) {
                let formData = new FormData();
                formData.append('to', this.draftEmail.to.character_id);
                formData.append('reply', this.draftEmail.reply);
                formData.append('subject', this.draftEmail.subject);
                formData.append('body', this.draftEmail.body)
                if(this.draftEmail.attachment != null) {
                    formData.append('attachment', this.draftEmail.attachment);
                }

                axios.post('/email', formData).then(response => {
                    this.resetDraftEmail();
                });
                $('#composeModal').modal('hide');
            },
            sendReplyEmail: function (emailId) {
                let appScope = this;
                var found = this.characterEmails.find(function (email) {
                    if (email.character_email_id == emailId) {
                        email.reply = appScope.draftEmail;
                        return email
                    }
                });

                let formData = new FormData();
                formData.append('to', this.draftEmail.to.character_id);
                formData.append('reply', this.draftEmail.reply);
                formData.append('subject', this.draftEmail.subject);
                formData.append('body', this.draftEmail.body)
                formData.append('character_email_id', this.draftEmail.character_email_id)
                if(this.draftEmail.attachment != null) {
                    formData.append('attachment', this.draftEmail.attachment);
                }

                axios.post('/email', formData).then(response => {
                    this.studentEmails.push(this.draftEmail);
                    this.resetDraftEmail();
                    this.$forceUpdate();
                });
                $('#readModal').modal('hide');
            },
            replyEmail: function () {

//                this.draftEmail.reply = this.readModalData.id;
//
//                $('#replyForm').show();
//                $('.replyEmail').html('Send');

//                this.resetDraftEmail();
                $('.replyForm').css('display', 'inherit');
                $('.replyEmail').css('display', 'none');
                $('.sendReplyEmail').css('display', 'initial');
                this.draftEmail.to = this.findCharData();
                this.draftEmail.subject = this.readModalData.subject;
                this.draftEmail.character_email_id = this.readModalData.character_email_id;

            },
            resetDraftEmail: function () {
                // Reset the draft email
                $('.replyForm').css('display', 'none');
                $('.replyEmail').css('display', 'initial');
                $('.sendReplyEmail').css('display', 'none');
                this.draftEmail = {
                    attachment: null,
                    to: "Please Select Character from Dropdown",
                    reply: 0,
                    subject: "",
                    body: ""
                };
            },
            findCharData: function () {
                let appScope = this;
                var found = this.characters.find(function (element) {
                    console.log(element);
                    return element.name == appScope.readModalData.from;
                });
                return found;
            },
            setAttachment: function () {
                this.draftEmail.attachment = this.$refs.file.files[0];
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
        padding: 10px 12px;
    }
    textarea{
        resize: none;
        height: 20rem;
    }
    td, th {
        padding: 10px;
    }
    .row{
        margin: 0px;
    }
    .truncate{
        max-width: 115px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .compose{
        margin: 20px;
    }
    #toBody{
        height: 30rem;
        resize: none;
    }
    .email-body{
        margin: 30px 0 40px;
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
        padding-left: 30px;
        position: absolute;
        height: 20px;
    }
    .greyText {
        color: darkgrey;
    }
    #composeModal > .modal-dialog > .modal-content{
        height: 44rem;
        width: 35rem;
    }
    #readModal > .modal-dialog > .modal-content{
        width: 35rem;
    }
    .modal-body{
        height: 80%
    }
    .modal-title{
        margin: -9px 0;
        justify-content: flex-start;
    }
    .toggle {
        margin: 20px;
        cursor: pointer;
    }
    .flex-header{
        display: flex;
        justify-content: space-between;
    }

    @media(min-width: 1024px){
        .truncate {
            max-width: 23rem;
        }
    }
    @media(min-width: 1224px){
        .compose{
            margin: 0;
            margin-top: 20px;
            //height: auto;
            //width: auto;
        }
        #composeModal > .modal-dialog > .modal-content{
            width: 50rem;
        }
        #readModal > .modal-dialog > .modal-content{
            width: 50rem;
        }
        .truncate{
            max-width: 35rem;
        }
    }
</style>
