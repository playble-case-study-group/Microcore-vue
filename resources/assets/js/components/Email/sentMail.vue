<template>
    <div class="sent">
        <div class="row">
            <div class="col-sm-12 col-lg-10">
                <table id="sent" class="col-sm-12">
                    <tr>
                        <th>To</th>
                        <th>Subject</th>
                        <th>Day</th>
                        <th></th>
                    </tr>
                    <tr v-for="email in studentEmails"
                        @click="readEmail(email)"
                        :key="email.student_email_id">
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
                        <h5 v-if="this.readModalData.reply">
                            From: {{ readModalData.from }}
                        </h5>
                        <h5 v-else>
                            From: {{  this.$store.state.user.name }}
                        </h5>
                        <p>Subject: {{ readModalData.subject }}</p>
                        <p class="email-body" v-if="this.readModalData.reply">{{ readModalData.reply.body }}</p>
                        <div class="email-body" v-else>{{ this.readModalData.body }}</div>
                        <span v-if="this.readModalData.reply">
                            <hr>
                            <h5>
                                From: {{  this.$store.state.user.name }}
                            </h5>
                            <p>Subject: {{ readModalData.subject }}</p>
                            <div class="email-body">{{ this.readModalData.body }}</div>
                        </span>
                    </div>
                    <div class="modal-footer" id="ReplyEmailId">
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'

    export default {

        components: {
        },
        data: function () {
            return {
                readModalData: {
                    character_email_id: 0,
                    id: 0,
                    from: "",
                    subject: "",
                    body: "",
                    reply: ""
                }
            }
        },
        props: {
            studentEmails: Array
        },
        mounted() {

        },
        methods: {
            readEmail: function (email) {
                this.readModalData.id = email.character_email_id;
                this.readModalData.from = email.name;
                this.readModalData.subject = email.subject;
                this.readModalData.body = email.body;
                this.readModalData.reply = email.reply;
                this.readModalData.character_email_id = email.character_email_id;
                $('#readModal').modal();
            },
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
    .greyText {
        color: darkgrey;
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
        .sidebar{
            display: initial;
            background-color: white;
            height: 56rem;
            border-right: 1px solid rgb(200, 200, 200);
            padding-left: 0px;
        }
        .compose{
            margin: 0;
            margin-top: 20px;
            //height: auto;
            //width: auto;
        }
        .mobile-menu{
            display: none;
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
    @media(min-width: 1400px){
        .compose{
            height: 40px;
            width: 130px;
        }
    }
</style>
