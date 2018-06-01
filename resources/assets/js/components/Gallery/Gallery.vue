<template>
    <div id="gallery" class="container">


        <!-- The Gallery View -->
        <h1>Welcome to the Gallery</h1>
        <hr>
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Filter
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a href="#" class="dropdown-item" @click="showAllGallery">Show All</a>
                <a v-for="(tag, key) in tags"
                   href="#"
                   class="dropdown-item"
                   @click="filterGallery(tag)"
                   :key="key">
                    {{ tag.title }}
                </a>
            </div>
        </div>

        <div class="card-columns">
            <div class="card"
                 v-for="artifact in gallery"
                 v-if="!artifact.hidden"
                 :key="artifact.artifact_id">

                <img class="card-img-top"
                     @click="openModal(artifact)"
                     :src="artifact.image"
                     :alt="artifact.title">
                <div class="card-body artifact" >
                    <h4 class="card-title">{{ artifact.title }}</h4>
                    <p class="card-text">{{ artifact.description}}</p>
                    <button v-for="tag in artifact.tags"
                            type="button"
                            @click="filterGallery(tag)"
                            class="btn btn-primary tag-btn">
                        {{ tag.title }}
                    </button>
                </div>

            </div>
        </div>


        <!-- Large modal -->
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
                            <div class="row col-sm-12">
                                <img slot="image" :src="modal.image" :alt="modal.title" class="img-responsive">
                            </div>
                            <div id="display-art">
                                <div class="row">
                                    <div class="col-sm-10">
                                        <h4>{{ modal.title }}</h4>
                                    </div>
                                    <div class="col-sm-2">
                                        <button class="btn btn-primary btn-sm" @click="editArtifact()" type="button">Edit Artifact</button>
                                    </div>
                                </div>
                                <div class="row col-sm-12">
                                    <p>{{ modal.description }}</p>
                                </div>
                                <div class="row col-sm-12">
                                    <button v-for="tag in modal.tags"
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
                                    <input id="formTitle" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Please enter a title..." v-model="modal.title">
                                </div>
                                <div class="form-group">
                                    <h4>Description</h4>
                                    <textarea id="formDescription"
                                              placeholder="Please add artifact description..."
                                              class="form-control"
                                              rows="4"
                                              v-model="modal.description">
                                    </textarea>
                                </div>
                                <div class="form-group">
                                    <h4>Tags</h4>
                                    <button v-for="(tag, key) in modal.tags"
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

    </div>
</template>

<script>

    import vSelect  from 'vue-select'


    export default {
        props: {
            gallery: Array,
            tags: Array
        },
        components: {
            'v-select': vSelect
        },
        data: function(){
            return {
                groupArt: [],
                showModal: false,
                newTag: '',
                modal: {
                    id: 0,
                    editId: 0,
                    category: 0,
                    image: '',
                    title: '',
                    description: '',
                    tags: []
                }
            }
        },
        mounted() {
            $('.artifact-modal').on('hidden.bs.modal', this.cancelChanges)
        },
        methods: {
            removeTag: function (tag) {
                _.remove(this.modal.tags, tag);
                this.$forceUpdate();
            },
            addTag: function () {
                if(!_.find(this.modal.tags, this.newTag)) {
                    this.modal.tags.push(this.newTag);
                }
            },
            showAllGallery: function () {
                this.gallery.forEach( artifact => { artifact.hidden = false });
                this.$forceUpdate();
            },
            filterGallery: function (tag) {
                  this.gallery.forEach( artifact => {
                      if (!artifact.tags.find( art => { return art.tag_id === tag.tag_id })) {
                          artifact.hidden = true;
                      } else {
                          artifact.hidden = false;
                      }
                  });
                this.$forceUpdate();
            },
            openModal: function(modalArtifact) {
                $('.artifact-modal').modal();
                this.modal.image = modalArtifact.image;
                this.modal.title = modalArtifact.title;
                this.modal.description = modalArtifact.description;
                this.modal.id = modalArtifact.artifact_id;
                this.modal.editId = modalArtifact.edit_id;
                this.modal.category = modalArtifact.catagory;
                this.modal.tags = modalArtifact.tags;
                this.newTag = this.tags[0];
            },
            closeModal: function() {
                $('.artifact-modal').modal();
            },
            saveChanges: function() {
                axios.put('/gallery/' + this.modal.id, {
                    user: this.user.user_id,
                    title: this.modal.title,
                    description: this.modal.description,
                    img: this.modal.image,
                    galleryId: this.modal.id,
                    editID: this.modal.editId,
                    category: this.modal.category,
                    tags: this.modal.tags
                }).then(function( response ){
                    console.log('success!');
                }).catch(function(){
                    console.log('FAILURE!!');
                });

                let update = this.gallery.find ( art => art.artifact_id === this.modal.id);
                update.description = this.modal.description;
                update.title = this.modal.title;
                $('#edit-art').addClass('d-none');
                $('#save-art').addClass('d-none');
                $('#display-art').removeClass('d-none');
            },
            cancelChanges: function () {
                let old = this.gallery.find ( art => art.artifact_id === this.modal.id);
                this.modal.title = old.title;
                this.modal.description = old.description;
                this.modal.tags = old.tags;
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

