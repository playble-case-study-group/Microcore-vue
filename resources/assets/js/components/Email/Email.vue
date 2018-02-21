<template>
    <div class="container">
        <h1>Welcome to email</h1>
    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'

    export default {


        data: function () {
            return {
                emails: []
            }
        },
        mounted() {
            console.log('Component mounted.');

            axios.post('/returnemails').then(function(response) {
                //console.log(response.data);
                console.log(this.emails);
                this.emails = response.data;

            })
        },
        methods: mapActions([
            'toggleTask'
        ])
    }
</script>
