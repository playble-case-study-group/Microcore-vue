<template>

    <div id="chatbot">
        <h1>This is a chatbot</h1>
        <input type="text" v-model="user_message" @keyup.enter="submitMessage">
        <button class="btn btn-primary" @click="submitMessage()">Submit</button>
        {{ bot_response }}
    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'
    import { ApiAiClient } from 'api-ai-javascript'
    const client_1 = new ApiAiClient({accessToken: '884bfc04fd474126993d40f682471515'}) // <- replace it with yours

    const client_2 = new ApiAiClient({accessToken: 'c31305b92c7443f1908e821264a193ae'}) // <- replace it with yours

    export default {

        data: function () {
            return {
                user_message: "",
                bot_response: []
            }
        },
        mounted() {
            console.log('Component mounted.');
//            client_1.eventRequest("custom_event").then( response => {
//                console.log(response);
//                this.bot_response.push( response.result.fulfillment.speech);
//            });

            client_2.eventRequest("WELCOME").then( response => {
                console.log(response);
                this.bot_response.push( response.result.fulfillment.speech);
            });
        },
        methods: {
            submitMessage: function () {
//                client_1.textRequest(this.user_message).then( response => {
//                    console.log(response);
//                    this.bot_response.push(response.result.fulfillment.speech);
//                });

                client_2.textRequest(this.user_message).then( response => {
                    console.log(response);
                    this.bot_response.push(response.result.fulfillment.speech);
                });

            }
        }
    }
</script>
