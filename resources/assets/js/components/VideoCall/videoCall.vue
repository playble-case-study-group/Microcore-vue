<template>
    <div id="videocall" class="container">
        <div class="row">
                <notes id="notesParent" class="col-sm-11 col-lg-3"
                       :notes="this.notes">
                </notes>
                <character-video class="col-sm-11 col-lg-8"
                                 :characters="this.contacts"
                                 :calls="this.calls"
                                 :questions="this.questions"
                                 :disabledQuestions="this.disabled">

                </character-video>
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
        props: {
            calls: Array,
            questions: Array,
            disabled: Array,
            notes: Object,
            contacts: Array
        }
    }
</script>

<style scoped>
    #videocall{
        margin: 3rem 3rem;
    }
    #notesParent{
        height:40rem;
        top: 2rem;
        align-self: start;
    }
    .row{
        flex-flow: wrap-reverse;
        flex-direction: row-reverse;
        justify-content: space-around;
    }

    @media(min-width:992px){
        #notesParent{
            height:42rem;
            top: 0;
        }
    }
    @media(min-width: 1350px){
        #notesParent{
            height: 45rem;
        }
    }

</style>