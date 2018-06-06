<template>
    <div class="modal fade artifact-modal" tabindex="-1" role="dialog" aria-labelledby="artifactModalDialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">

                            <div class="col-sm-6 text-center">
                                <button id="previousBtn" @click="$emit('previousArtifact')"><i class="material-icons">
                                    chevron_left
                                </i></button>
                            </div>
                            <div class="col-sm-6 text-center">
                                <button id="nextBtn" @click="$emit('nextArtifact')"><i class="material-icons">
                                    chevron_right
                                </i></button>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-sm-1">
                                <!--<button id="previousBtn" @click="$emit('previousArtifact')">Previous Artifact</button>-->
                            </div>
                            <div class="col-sm-10">
                                <img slot="image" :src="artifactData.image" :alt="artifactData.title" class="img-responsive">
                            </div>
                            <div class="col-sm-1">
                                <!--<button id="nextBtn" @click="$emit('nextArtifact')">Next Artifact</button>-->
                            </div>

                        </div>
                        <div id="display-art">
                            <div class="row">
                                <div class="col-sm-10">
                                    <h4>{{ artifactData.title }}</h4>
                                </div>
                                <div class="col-sm-2">
                                    <button class="btn btn-primary btn-sm" @click="editArtifact()" type="button">Edit Artifact</button>
                                </div>
                            </div>
                            <div class="row col-sm-12">
                                <p>{{ artifactData.description }}</p>
                            </div>
                            <div class="row col-sm-12">
                                <button v-for="tag in artifactData.tags"
                                        type="button"
                                        class="btn btn-primary tag-btn">
                                    {{ tag.title }}
                                </button>
                            </div>
                        </div>

                        <!-- Form for editing the artifact -->
                        <div id="edit-art" class="d-none">
                            <div class="form-group">
                                <h4>Title</h4>
                                <input id="formTitle" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Please enter a title..." v-model="artifactData.title">
                            </div>
                            <div class="form-group">
                                <h4>Description</h4>
                                <textarea id="formDescription"
                                          placeholder="Please add artifact description..."
                                          class="form-control"
                                          rows="4"
                                          v-model="artifactData.description">
                                </textarea>
                            </div>
                            <div class="form-group">
                                <h4>Tags</h4>
                                <button v-for="(tag, key) in artifactData.tags"
                                        :key="key"
                                        type="button"
                                        @click="removeTag(tag)"
                                        class="btn btn-danger">
                                    {{ tag.title }} &times;
                                </button>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <v-select v-model="newTag" label="title" :options="tags"></v-select>
                                </div>
                                <div class="col-sm-2">
                                    <button class="btn btn-success" @click="addTag">
                                        Add Tag
                                    </button>
                                </div>

                            </div>
                        </div>

                        <div id="save-art" class="row col-sm-12 d-none form-group">
                            <button type="button" class="btn btn-outline-info" @click="cancelChanges()"> Cancel </button>
                            <button type="button" class="btn btn-primary" @click="saveChanges()">Save changes</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
    import vSelect  from 'vue-select'

    export default {
        components: {
            'v-select': vSelect
        },
        props: {
            tags: Array,
            artifactData: Object,
            modalOpen: Boolean
        },
        data: function () {
            return {
                newTag: '',
                originalArtifact: {}
            }
        },
        watch: {
            artifactData: function () {
                this.originalArtifact = this.artifactData;
                $('.artifact-modal').modal();
            }
        },
        mounted() {
            $('.artifact-modal').on('hidden.bs.modal', this.cancelChanges)
        },
        methods: {
            openModal: function () {
                $('.artifact-modal').modal();
            },
            removeTag: function (tag) {
                _.remove(this.artifactData.tags, tag);
                this.$forceUpdate();
            },
            addTag: function () {
                if(!_.find(this.artifactData.tags, this.newTag)) {
                    this.artifactData.tags.push(this.newTag);
                }
            },
            closeModal: function() {
                $('.artifact-modal').modal();
            },
            saveChanges: function() {
                axios.put('/gallery/' + this.artifactData.artifact_id, {
                    user: this.user.user_id,
                    title: this.artifactData.title,
                    description: this.artifactData.description,
                    img: this.artifactData.image,
                    galleryId: this.artifactData.artifact_id,
                    editID: this.artifactData.editId,
                    category: this.artifactData.category,
                    tags: this.artifactData.tags
                }).then(function( response ){
                    console.log('success!');
                }).catch(function(){
                    console.log('FAILURE!!');
                });

//                let update = this.gallery.find ( art => art.artifact_id === this.artifactData.id);
//                update.description = this.artifactData.description;
//                update.title = this.artifactData.title;
                $('#edit-art').addClass('d-none');
                $('#save-art').addClass('d-none');
                $('#display-art').removeClass('d-none');
            },
            cancelChanges: function () {
                this.artifactData.title = this.originalArtifact.title;
                this.artifactData.description = this.originalArtifact.description;
                this.artifactData.tags = this.originalArtifact.tags;
                $('#edit-art').addClass('d-none');
                $('#save-art').addClass('d-none');
                $('#display-art').removeClass('d-none');
            },
            editArtifact: function () {
                $('#display-art').addClass('d-none');
                $('#edit-art').removeClass('d-none');
                $('#save-art').removeClass('d-none');
            }
        },
        computed: {
            user: function() {
                return this.$store.state.user;
            }
        }
    }
</script>

<style lang="scss" scoped>
    /*#previousBtn, #nextBtn {*/
        /*position: relative;*/
        /*top: 50%;*/
        /*bottom: 50%;*/
    /*}*/

    /*#previousBtn {*/
        /*right: 150px;*/
    /*}*/

    /*#nextBtn {*/
        /*left: 110px;*/
    /*}*/

    .row {
        /*-moz-column-width: 18em;*/
        /*-webkit-column-width: 18em;*/
        /*-moz-column-gap: 1em;*/
        /*-webkit-column-gap:1em;*/


    }

    #display-art, #edit-art {
        margin-top: 20px;
    }

    .tag-btn {
        margin-right: 10px;
    }

    .modal-body img {
        width: 100%;
        height: 100%;
    }

    .artifact{
        background-color: white;
    }

    .item {
        /*display: inline-flex;*/
        /*padding:  .25rem;*/
    }

    .well {
        position:relative;
        display: block;
    }
    .grid{
        /*max-width: 1200px;*/
    }
    .grid:after {
        content: '';
        display: block;
        clear: both;
    }
    .grid-item{
        float: left;
        width: 240px;
        height: auto;
    }

</style>