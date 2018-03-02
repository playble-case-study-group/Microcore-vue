<template>
    <div id="notes">

        <h3> Notes </h3>
        <textarea rows="5" cols="50" v-model="note" v-on:keyup="update" ></textarea>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        mounted() {
        },
        data: function() {
          return {
              note: ''
          }
        },
        methods: {
            update: function () {
                axios
                    .post(
                        "/videocall",
                        {
                            note: this.note,
                            user: this.$store.state.user.id,
                            day: this.$store.state.user.current_day
                        }
                    )
                    .then(r => console.log(r))
                    .catch(e => console.log(e));
            },
            fetch: function() {
                axios
                    .get(
                        "/videocall",
                        {
                            user: this.$store.state.user.id,
                            day: this.$store.state.user.current_day
                        }
                    )
                    .then(r => console.log(r))
                    .catch(e => console.log(e));
            }
        }

    }

</script>