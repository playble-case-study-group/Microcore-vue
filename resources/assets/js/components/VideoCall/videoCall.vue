<template>
    <div id="videocall" class="container">
        <div class="row">
            <div class="d-flex">
                <notes id="notesParent" class="col-sm-11 col-md-3 col-lg-3"
                       :notes="this.notes">
                </notes>
                <character-video class="col-sm-11 col-md-8 col-lg-8"
                                 :characters="this.contacts"
                                 :calls="this.calls"
                                 :questions="this.questions">

                </character-video>
           </div>
        </div>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import notes from './notes.vue'
    import videos from './videos.vue'

    export default {

        components: {
            'notes': notes,
            'character-video': videos,
        },
        props: ['calls', 'questions', 'notes', 'contacts'],
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>

<style scoped>
    #videocall{
        margin: 3rem 3rem;
    }
    #notesParent{
        height:40rem;
        top: 15px;
    }
    .d-flex{
        display: flex;
        flex-flow: column-reverse;
    }
    @media(min-width:992px){
        .d-flex{
            flex-flow: initial;
            justify-content: space-evenly;
        }
        #notesParent{
            height:70rem;
            top: -22px;
        }
    }

</style>