<!--suppress ALL -->
<template>
    <div id="notes">

        <h3> Notes </h3>
        <textarea rows="5" cols="50" v-model="note" v-on:keyup="update" >{{ note }}</textarea>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        mounted() {
            this.fetch()
        },
        data: function() {
          return {
              note: ''
          }
        },
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
                            day: this.$store.state.user.current_day
                        }
                    )
                    .then(r => console.log(r))
            .catch(e => console.log(e));
            },
            fetch: function () {
                let current_day = this.$store.state.user.current_day;
                axios.get('/videocall/'+this.$store.state.user.id)
                    .then((data) => {
                    let arr = data.data;
                    let notes = arr.filter((day_note) => {
                        if(day_note.day === current_day){
                            return day_note
                        }
                    }).map((day_note) => {
                            this.note = day_note.note;
                        return day_note.note;
                    })
                console.log(notes);
                    return notes;
                })
            }
        }

    }

</script>