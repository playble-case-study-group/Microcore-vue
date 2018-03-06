<template>
    <div id="video">
        <video width="520" height="340" id="char_vid" :src="videourl" controls>
        </video>

    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        mounted() {
        },
        props: ['video', 'active'],
        computed: {
            videourl: function() {
                let contacts = this.video.filter((el) => {
                    if (el.charID === this.active) {
                        return el;
                    }
                })
                    .map((el) => {
                        return el.url;
                    })
                return contacts;
            },
            videoEl: function(){
                return document.getElementById('char_vid');
            }
        },
        watch: {
        }
    }
</script>

<style scoped>
    .content {
        padding: 20px;
    }

    #video {
        /*border: solid 1px;*/
    }

</style>