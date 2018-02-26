<template>
    <div id="notes">

        <h3> Notes </h3>
        <textarea rows="5" cols="50" v-model="note" v-on:keydown="update" ></textarea>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        mounted() {
        },
        data: function() {
          return {
              note: ""
          }
        },
        methods: {
            update: function (notes) {
                axios.post('/videocall', {data: this.note})
                    .then((response)=>{
                        console.log(response)
                    }).catch((error)=>{
                    console.log(error.response.data)
                })
            }
        }

    }

</script>