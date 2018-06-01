<template>
    <li class="clearfix">
        <div class="message-data align-right">
            <span class="message-data-time" >{{ message.time }}</span> &nbsp; &nbsp;
            <span class="message-data-name" >{{ message.name }}</span> <i class="fa fa-circle me"></i>

        </div>
        <div class="message other-message float-right">
            {{ message.message }}
        </div>
    </li>
</template>

<script>


    export default {

        mounted() {
//            console.log('Response mounted.')
            this.lastChatMessage();
        },
        props: ['message', 'isLast'],
        methods: {
            lastChatMessage: function () {
                if(this.isLast) {
                    this.$emit('last_msg');
                }
            }
        }
    }
</script>
