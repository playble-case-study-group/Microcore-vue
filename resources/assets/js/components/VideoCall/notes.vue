<!--suppress ALL -->
<template>
    <div id="notes">
        <div id="header" ><h3>Notes</h3></div>
        <textarea v-model="note" v-on:keyup="postUpdatedNote"></textarea>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        mounted() {
            this.extractNoteObject();
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
            postUpdatedNote: function () {
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
            extractNoteObject: function(){
                this.note = this.notes[0].note;
            }
        }
    }

</script>

<style scoped>
    @include media-breakpoint-up(xs, md){
        #notes{
            display:block;
        }
    }
    #notes{
        margin: 20px;
        width: 35%

    }
    textarea{
        width: 100%;
        height: 75%;
        border:none;
        padding: 20px;

    }
    #header{
        color: white;
        background-color: #2b2b2b;
        height: 40px;
    }
    h3{
        padding: 10px;
    }

</style>