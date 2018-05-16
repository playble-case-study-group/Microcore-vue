<template>
    <div id="videocall" class="container">
        <div class="row">
                <notes id="notesParent" class="col-sm-11 col-lg-3"
                       :notes="this.notes">
                </notes>
                <character-video class="col-sm-11 col-lg-8"
                                 :characters="this.contacts"
                                 :calls="this.calls"
                                 :questions="this.questions">

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
        top: 15px;
    }
    .row{
        flex-flow: wrap-reverse;
    }
    @media(min-width:992px){
        #notesParent{
            height:70rem;
            top: 0px;
        }
    }

</style>