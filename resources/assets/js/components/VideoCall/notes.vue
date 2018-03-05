<!--suppress ALL -->
<template>
    <div id="notes">

        <h3> Notes </h3>
        <textarea rows="5" cols="50" v-model="note" v-on:keyup="update"></textarea>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        mounted() {
            this.setNote();
        },
        data: function() {
          return {
              note: ''
          }
        },
        props: ['notes'],
        computed: {
        },
        methods: {
            update: function () {
                axios
                    .post(
                        "/videocall",
                        {
                            note: this.note,
                            user: this.$store.state.user.id,
                        }
                    )
                    .then(r => console.log(r))
            .catch(e => console.log(e));
            },
            setNote: function(){
                this.note = this.notes;
            }
        }

    }

</script>