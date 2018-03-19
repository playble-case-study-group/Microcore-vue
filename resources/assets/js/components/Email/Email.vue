<template>
    <div class="container">
        <div class="row">
            <div class="heading col-sm-12">
                <h1>Messages</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3" style="background-color: #ffffff; height: 100vh">
                <ul>
                    <li>Inbox</li>
                    <li>Sent</li>
                </ul>
            </div>
            <div class="col-sm-9">
                <table>
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
            </div>

        </div>

        <!-- Read Modal -->
        <div class="modal fade" id="readModal" tabindex="-1" role="dialog" aria-labelledby="readModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">{{ readModalData.readSubject }}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4><b>{{ readModalData.readFrom }}</b></h4>
                        <p>{{ readModalData.readBody }}</p>
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
                draftemailsubject: "",
                draftemailbody: "",
                readModalData: {
                    readFrom: "",
                    readSubject: "",
                    readBody: ""
                }

            }
        },
        props: ['characterEmails'],
        mounted() {
            console.log('Component mounted.');


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
                this.readModalData.readFrom = email.name;
                this.readModalData.readSubject = email.subject;
                this.readModalData.readBody = email.body;

                $('#readModal').modal();
                console.log(email)
            }
        }

    }
</script>

<style scoped lang="scss">

    .container {
        margin-left: 40px;
        margin-top: 40px;
        padding: 0;
        /*padding: 20px;*/
        background-color: white;
    }

    .heading {
        background-color: #4A4A4A;
        height: 40px;
        color: white;

        h1 {
            margin: 0;
            padding: 8px 10px;
        }

    }

    td, th {
        padding: 10px;
    }
</style>
