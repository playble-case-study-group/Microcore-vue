<template>
    <div class="container main">

        <div class="row">
            <div role="banner" class="heading flex-header col-sm-12">
                <h1>Messages</h1>
                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" @click="closeNav">&times;</a>
                    <button class="btn btn-success compose" @click="composeModal">Compose</button>
                    <div class="toggle" @click="toggleInbox"><span>Inbox</span></div>
                    <div class="toggle" @click="toggleSent"><span>Sent</span></div>
                </div>
                <a href="#"><i class="material-icons mobile-menu" @click="openNav">menu</i></a>
            </div>
        </div>

        <div class="row content">
            <div class="sidebar col-md-2">
                <button class="btn btn-success compose" @click="composeModal">Compose</button>
                <ul>
                    <li class="inboxToggle" style="background-color: white;" @click="toggleInbox"><div class="keyline keyline-inbox">Inbox</div></li>
                    <li class="sentToggle" @click="toggleSent"><div class="keyline keyline-sent">Sent</div></li>
                </ul>
            </div>
            <div class="col-sm-12 col-lg-10 emailList">
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
                        <td class="truncate">
                            {{ email.subject }}
                        </td>
                        <td class="truncate">
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
                        <td class="truncate">
                            {{ email.subject }}
                        </td>
                        <td class="truncate">
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
                $('.keyline-inbox').css('border-color', '#636b6f');
                $('.keyline-sent').css('border-color', 'white');
                $('#sent').hide();
                console.log('inbox');
            },
            toggleSent: function () {
                $('#inbox').hide();
                $('.keyline-inbox').css('border-color', 'white');
                $('.keyline-sent').css('border-color', '#636b6f');
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
            },
            openNav: function() {
                document.getElementById("mySidenav").style.width = "200px";
                console.log('menu');
            },
            closeNav: function() {
                document.getElementById("mySidenav").style.width = "0";
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
    hr {
        width: 1px;
        height: 25px;
        color: #c8c8c8;
    }
    .main{
        height: 60rem;
        overflow-y: scroll;
    }
    .row{
        margin: 0px;

    }
    .emailList{
        margin-top: 20px;
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
        margin: -5px 0;
        justify-content: flex-start;
    }
    .keyline{
        border-left: solid 4px #636b6f;
        padding-left: 20px;
    }
    .keyline-sent{
        border-color: white;
    }
    .keyline-inbox{
        border-color: #636b6f;
    }
    .sidebar{
        display: none;
    }
    .toggle {
        margin: 20px;
        cursor: pointer;
    }
    .flex-header{
        display: flex;
        justify-content: space-between;
    }
    .mobile-menu{
        font-size: 26px;
        color: white;
    }
    /* The side navigation menu */
    .sidenav {
        height: 100%; /* 100% Full-height */
        width: 0; /* 0 width - change this with JavaScript */
        height: 60rem;
        position: absolute; /* Stay in place */
        z-index: 1; /* Stay on top */
        right: 0;
        background-color: #4a4a4a;
        overflow-x: hidden; /* Disable horizontal scroll */
        padding-top: 60px; /* Place content 60px from the top */
        transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
    }

    /* The navigation menu links */
    .sidenav a {
        padding: 8px 8px 8px 32px;
        text-decoration: none;
        font-size: 25px;
        color: #818181;
        display: block;
        transition: 0.3s;
    }

    /* When you mouse over the navigation links, change their color */
    .sidenav a:hover {
        color: #f1f1f1;
    }

    /* Position and style the close button (top right corner) */
    .sidenav .closebtn {
        position: absolute;
        top: 0;
        right: 25px;
        font-size: 36px;
        margin-left: 50px;
    }

    /* Style page content - use this if you want to push the page content to the right when you open the side navigation */
    .content {
        transition: margin-left .5s;
        padding: 20px;
    }

    /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
    @media screen and (max-height: 450px) {
        .sidenav {padding-top: 15px;}
        .sidenav a {font-size: 18px;}
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
            max-width: 20rem;
        }
    }
    @media(min-width: 1400px){
        .compose{
            height: 40px;
            width: 130px;
        }
    }
</style>
