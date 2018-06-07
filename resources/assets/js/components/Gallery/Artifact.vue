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

                            <div class="col-sm-6" style="height: 0">
                                <button id="previousBtn" @click="$emit('previousArtifact')"><i class="material-icons" style="font-size: 48px">
                                    chevron_left
                                </i></button>
                            </div>
                            <div class="col-sm-6 text-right" style="height: 0">
                                <button id="nextBtn" @click="$emit('nextArtifact')"><i class="material-icons" style="font-size: 48px">
                                    chevron_right
                                </i></button>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <img slot="image" :src="artifactData.image" :alt="artifactData.title" class="img-fluid">
                            </div>
                        </div>
                        <div id="display-art">
                            <div class="row title-row">
                                <div class="col-sm-11">
                                    <h4>{{ artifactData.title }}</h4>
                                    <input type="text" class="form-control" aria-describedby="emailHelp" placeholder="Please enter a title..." v-model="artifactData.title">
                                </div>
                                <div class="col-sm-1">
                                    <i class="material-icons title-edit" @click="titleEdit( artifactData.title )">edit</i>
                                    <i class="material-icons title-save" @click="titleSave">check</i>
                                    <i class="material-icons title-cancel" @click="titleCancel">cancel</i>
                                </div>
                            </div>
                            <div class="row description-row">
                                <div class="col-sm-11">
                                    <p>{{ artifactData.description }}</p>
                                    <textarea placeholder="Please add artifact description..."
                                              class="form-control"
                                              rows="4"
                                              v-model="artifactData.description">
                                    </textarea>
                                </div>
                                <div class="col-sm-1">
                                    <i class="material-icons description-edit" @click="descriptionEdit(artifactData.description)">edit</i>
                                    <i class="material-icons description-save" @click="descriptionSave">check</i>
                                    <i class="material-icons description-cancel" @click="descriptionCancel">cancel</i>
                                </div>
                            </div>
                            <div class="row col-sm-12" id="artifact-tags">
                                <button v-for="tag in artifactData.tags"
                                        @click="removeTag(tag)"
                                        type="button"
                                        class="btn btn-primary tag-btn">
                                    {{ tag.title }} &times;
                                </button>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <v-select v-model="newTag" label="title" :options="tags"></v-select>
                                </div>
                            </div>
                        </div>

                        <!-- Form for editing the artifact -->
                        <!--<div id="edit-art" class="d-none">-->
                            <!--<div class="form-group">-->
                                <!--<h4>Title</h4>-->
                                <!--<input id="formTitle" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Please enter a title..." v-model="artifactData.title">-->
                            <!--</div>-->
                            <!--<div class="form-group">-->
                                <!--<h4>Description</h4>-->
                                <!--<textarea id="formDescription"-->
                                          <!--placeholder="Please add artifact description..."-->
                                          <!--class="form-control"-->
                                          <!--rows="4"-->
                                          <!--v-model="artifactData.description">-->
                                <!--</textarea>-->
                            <!--</div>-->
                            <!--<div class="form-group" >-->
                                <!--<h4>Tags</h4>-->
                                <!--<button v-for="(tag, key) in artifactData.tags"-->
                                        <!--:key="key"-->
                                        <!--type="button"-->
                                        <!--@click="removeTag(tag)"-->
                                        <!--class="btn btn-danger">-->
                                    <!--{{ tag.title }} &times;-->
                                <!--</button>-->
                            <!--</div>-->
                            <!--<div class="row">-->
                                <!--<div class="col-sm-6">-->
                                    <!--<v-select v-model="newTag" label="title" :options="tags"></v-select>-->
                                <!--</div>-->
                                <!--<div class="col-sm-2">-->
                                    <!--<button class="btn btn-success" @click="addTag">-->
                                        <!--Add Tag-->
                                    <!--</button>-->
                                <!--</div>-->

                            <!--</div>-->
                        <!--</div>-->

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
                originalArtifact: {},
                originalTitle: '',
                originalDescription: ''
            }
        },
        watch: {
            artifactData: function () {
                this.originalArtifact = this.artifactData;
                $('.artifact-modal').modal();
            },
            newTag: function () {
                this.addTag();
            }
        },
        mounted() {
            $('.artifact-modal').on('hidden.bs.modal', this.cancelChanges)
        },
        methods: {
            titleEdit: function (title) {
                this.originalTitle = title;
                $('.title-row h4, .title-edit').hide();
                $('.title-row input, .title-save, .title-cancel').show();
            },
            titleSave: function () {
                this.saveChanges();
                $('.title-row input, .title-save, .title-cancel').hide();
                $('.title-row h4, .title-edit').show();
            },
            titleCancel: function () {
                this.artifactData.title = this.originalTitle;
                $('.title-row input, .title-save, .title-cancel').hide();
                $('.title-row h4, .title-edit').show();
            },
            descriptionEdit: function (description) {
                this.originalDescription = description;
                $('.description-row p, .description-edit').hide();
                $('.description-row textarea, .description-save, .description-cancel').show();
            },
            descriptionSave: function () {
                this.saveChanges();
                $('.description-row textarea, .description-save, .description-cancel').hide();
                $('.description-row p, .description-edit').show();
            },
            descriptionCancel: function () {
                this.artifactData.description = this.originalDescription;
                $('.description-row textarea, .description-save, .description-cancel').hide();
                $('.description-row p, .description-edit').show();
            },
            openModal: function () {
                $('.artifact-modal').modal();
            },
            removeTag: function (tag) {
                _.remove(this.artifactData.tags, tag);
                this.saveChanges();
                this.$forceUpdate();
            },
            addTag: function () {
                if(!_.find(this.artifactData.tags, this.newTag)) {
                    this.artifactData.tags.push(this.newTag);
                    this.saveChanges();
                }
                this.newTag = null;
            },
            closeModal: function() {
                $('.artifact-modal').modal();
            },
            saveChanges: function() {
                let appScope = this;
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
                    appScope.$emit('saveArtifactChanges');
                }).catch(function( error ){
                    console.log(error);
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
//                this.artifactData.tags = this.originalArtifact.tags;
                this.newTag = null;
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

    .title-row input, .description-row textarea, .title-save, .title-cancel {
        display: none;
    }

    .description-edit, .description-cancel, .description-save, .title-edit, .title-cancel, .title-save {
        display: none;
        cursor: pointer;
        font-size: 18px;
    }

    .title-row:hover .title-edit {
        display: block;
    }

    .description-row:hover .description-edit {
        display: block;
    }

    #previousBtn, #nextBtn {
        position: relative;
        top: 30vh;
        /*bottom: 50vh;*/
    }

    #previousBtn {
         right: 100px;
     }

    #nextBtn {
        left: 100px;
    }

    .row {
        /*-moz-column-width: 18em;*/
        /*-webkit-column-width: 18em;*/
        /*-moz-column-gap: 1em;*/
        /*-webkit-column-gap:1em;*/

        margin-bottom: 1rem;
    }

    #display-art, #edit-art {
        margin-top: 20px;
    }

    #artifact-tags {
        margin-bottom: 1rem;
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