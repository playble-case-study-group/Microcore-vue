<!--suppress ALL -->
<template>
    <div id="notes">
        <div class="heading"><h3>My Notes</h3></div>
        <textarea v-model="note" v-on:keyup="postUpdatedNote"></textarea>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        data: function() {
          return {
              note: this.notes.note
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
        }
    }

</script>

<style scoped lang="scss">
    @import "../../../sass/_variables.scss";

    textarea{
        width: 100%;
        height: 87%;
        border:none;
        padding: 20px;
        resize:none;

    }
    h3{
        padding: 10px;
    }

</style>