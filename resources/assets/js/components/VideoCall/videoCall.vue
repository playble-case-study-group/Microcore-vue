<template>
    <div id="videocall" class="container">

        <div class="alert alert-success alert-dismissible fade show" id="submitSuccess" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>Success!</strong> Your video was submitted successfully.
        </div>

        <div class="alert alert-danger alert-dismissible fade show" id="submitFailure" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>Uh oh!</strong> There was an error in submitting your video.
        </div>
        <div class="row">
                <notes id="notesParent" class="col-sm-11 col-lg-3"
                       :notes="this.notes">
                </notes>
                <character-video class="col-sm-11 col-lg-8"
                                 @alertSuccess="alertSaveSuccess"
                                 @alertFailure="alertSaveFailure"
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
        mounted() {
            $('#submitSuccess').hide();
            $('#submitFailure').hide();
        },
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
        },
        methods: {
            alertSaveSuccess: function() {
                $('#submitSuccess').show();
                $('#submitSuccess').alert();
                setTimeout(function(){
                        $('#submitSuccess').hide();
                    }, 5000);

            },
            alertSaveFailure: function() {
                $('#submitFailure').show();
                $('#submitFailure').alert();
                setTimeout( function()
                    {
                        $('#submitFailure').hide();
                    }, 5000);

            }
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