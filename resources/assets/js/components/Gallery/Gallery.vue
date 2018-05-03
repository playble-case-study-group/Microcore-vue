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
                <a href="#" @click="showAllGallery">Show All</a>
                <a v-for="(tag, key) in tags"
                   href="#"
                   class="dropdown-item"
                   @click="filterGallery(tag)"
                   :key="key">
                    {{ tag.title }}
                </a>
            </div>
        </div>
        <div class="row">
            <div class="item" v-for="(artifact, key) in gallery" :key="key" :class="{hidden: artifact.hidden}">
                <div class="thumbnail" @click="openModal(artifact)">
                </div>
            </div>
        </div>

        <!--<br><br>-->
        <!--<ul class="nav nav-pills">-->
            <!--<li class="active"><a data-toggle="pill" href="#all" @click="filterArtifacts(false)">All</a></li>-->
            <!--<li><a data-toggle="pill" href="#group1" @click="filterArtifacts('group')">Group 1</a></li>-->
            <!--<li><a data-toggle="pill" href="#group2" @click="filterArtifacts('group2')">Group 2</a></li>-->
            <!--<li><a data-toggle="pill" href="#group3" @click="filterArtifacts('group3')">Group 3</a></li>-->
        <!--</ul>-->
        <hr>
        <div class="grid">
            <div class="item grid-item" v-for="artifact in groupArt">
                <div class="thumbnail artifact" @click="openModal(artifact)">

                    <img :src="artifact.image" :alt="artifact.title">
                    <h4>{{ artifact.title }}</h4>
                    <p>{{ artifact.description}}</p>
                </div>
            </div>
        </div>


        <!-- Modal View -->
        <Artifact v-if="showModal">
            <div slot="header">
                <button type="button" class="btn btn-outline-info" @click="closeModal()"> Close </button>
            </div>
            <div slot="body">
                <img slot="image" :src="modal.image" :alt="modal.title" class="img-responsive">
                <div id="display-art">
                    <button class="btn btn-primary btn-sm" @click="editArtifact()" type="button">Edit Artifact</button>
                    <h4>{{ modal.title }}</h4>
                    <p>{{ modal.description }}</p>
                </div>
                <div id="edit-art" class="hidden">
                    <div class="form-group">
                        <h4>Title</h4>
                        <label for="studentGallery">Gallery</label>
                        <input type="checkbox" id="studentGallery">
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
                </div>
            </div>

            <div slot="footer" id="save-art" class="hidden">
                <button type="button" class="btn btn-outline-info" @click="cancelChanges()"> Cancel </button>
                <button type="button" class="btn btn-primary" @click="saveChanges()">Save changes</button>
            </div>
        </Artifact>
    </div>
</template>

<script>
    //import mapState from 'vuex'
    import Artifact from './Artifact.vue'
    import axios from 'axios';

    export default {
        props: ['gallery', 'tags'],
        data: function(){
            return {
                artifacts: this.gallery,
                groupArt: [],
                showModal: false,
                modal: {
                    id: 0,
                    editId: 0,
                    category: 0,
                    image: '',
                    title: '',
                    description: ''
                }
            }
        },
        components: {
            Artifact
        },

        mounted() {
            console.log('Created()');
            this.filterArtifacts(false);

        },
        methods: {
            showAllGallery: function () {
                this.gallery.forEach( artifact => { artifact.hidden = false });
            },
            filterGallery: function (tag) {
                  this.gallery.forEach( artifact => {
                      console.log(!artifact.tags.find( art => { return art.tag_id === tag.tag_id }));
                      if (!artifact.tags.find( art => { return art.tag_id === tag.tag_id })) {
                          artifact.hidden = true;
                      } else {
                          artifact.hidden = false;
                      }
                  })
            },
            filterArtifacts: function(filter) {
                if (filter) {
                    let g = [];
                    this.artifacts.forEach(function (artifact) {
                        if (artifact.catagory === filter) {      //artifact.catagory.find(function(art) { art === filter}
                            g.push(artifact);
                        }
                    });
                    this.groupArt = g;
                } else {
                    this.groupArt = this.artifacts;
                }
            },
            openModal: function(modalArtifact) {
                this.showModal = true;
                this.modal.image = modalArtifact.image;
                this.modal.title = modalArtifact.title;
                this.modal.description = modalArtifact.description;
                this.modal.id = modalArtifact.gallery_id;
                this.modal.editId = modalArtifact.edit_id;
                this.modal.category = modalArtifact.catagory;
            },
            closeModal: function() {
                this.showModal = false;
            },
            saveChanges: function() {
                axios.put('/gallery/' + this.modal.id, {
                    user: this.user.id,
                    title: this.modal.title,
                    description: this.modal.description,
                    img: this.modal.image,
                    galleryId: this.modal.id,
                    editID: this.modal.editId,
                    category: this.modal.category
                }).then(function( response ){
                    console.log('success!')
                }).catch(function(){
                    console.log('FAILURE!!');
                });

                let update = this.gallery.find ( art => art.gallery_id === this.modal.id);
                update.description = this.modal.description;
                update.title = this.modal.title;
                $('#edit-art').addClass('hidden');
                $('#save-art').addClass('hidden');
                $('#display-art').removeClass('hidden');
            },
            cancelChanges: function () {
                let old = this.gallery.find ( art => art.gallery_id === this.modal.id);
                this.modal.title = old.title;
                this.modal.description = old.description;
                $('#edit-art').addClass('hidden');
                $('#save-art').addClass('hidden');
                $('#display-art').removeClass('hidden');
            },
            editArtifact: function () {
                $('#display-art').addClass('hidden');
                $('#edit-art').removeClass('hidden');
                $('#save-art').removeClass('hidden');
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
        -moz-column-width: 18em;
        -webkit-column-width: 18em;
        -moz-column-gap: 1em;
        -webkit-column-gap:1em;


    }

    .artifact{
        background-color: white;
    }

    .item {
        display: inline-flex;
        padding:  .25rem;
    }

    .well {
        position:relative;
        display: block;
    }
    .grid{
        max-width: 1200px;
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

