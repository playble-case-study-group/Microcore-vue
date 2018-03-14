
<template>
    <div id="gallery" class="container">


        <!-- The Gallery View -->
        <h1>Welcome to the Gallery</h1>
        <hr>
        <ul class="nav nav-pills">
            <li class="active"><a data-toggle="pill" href="#all" @click="filterArtifacts(false)">All</a></li>
            <li><a data-toggle="pill" href="#group1" @click="filterArtifacts('group')">Group 1</a></li>
            <li><a data-toggle="pill" href="#group2" @click="filterArtifacts('group2')">Group 2</a></li>
            <li><a data-toggle="pill" href="#group3" @click="filterArtifacts('group3')">Group 3</a></li>
        </ul>
        <hr>
        <div class="row">
            <div class="item" v-for="artifact in groupArt">
                <div class="thumbnail" @click="openModal(artifact)">
                    <img :src="artifact.image" :alt="artifact.title">
                    <h4>{{ artifact.title }}</h4>
                    <p>{{ artifact.description}}</p>
                </div>
            </div>
        </div>

        <!-- Modal View -->
        <Artifact v-if="showModal">
            <img slot="image" :src="modalImage" :alt="modalTitle" class="img-responsive">
            <form slot="body" action="" method="post">
                <div class="form-group">
                    <h4>Title</h4>
                    <input id="formTitle" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Please enter a title..." v-model="modalTitle">
                </div>
                <div>
                    <h4>Description</h4>
                    <textarea id="formDescription" placeholder="Please add artifact description..." class="form-control" rows="4"  v-model="modalDescription"></textarea>
                </div>
            </form>
            <div slot="footer">
                <button type="button" class="btn btn-outline-info" @click="closeModal()"> Close </button>
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

        data: function(){
            return {
                artifacts: [],
                groupArt: [],
                showModal: false,
                modalImage: '',
                modalTitle: '',
                modalDescription: '',
                modalID: 0,
                modalEditID: 0,
                modalCatagory: ''
            }
        },
        components: {
            Artifact
        },

        mounted() {
            console.log('Created()');
            axios.get('/getartifacts').then(response => {
            this.artifacts = response.data;
            this.filterArtifacts(false);
                }).catch((error) => {
                console.log(error.config);
            });
        },
        methods: {
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
                this.modalImage = modalArtifact.image;
                this.modalTitle = modalArtifact.title;
                this.modalDescription = modalArtifact.description;
                this.modalID = modalArtifact.id;
                this.modalEditID = modalArtifact.edit_id;
                this.modalCatagory = modalArtifact.catagory;
            },
            closeModal: function() {
                this.showModal = false;
            },
            saveChanges: function() {
                axios.put('/gallery/' + this.modalID, {
                    user: this.user.id,
                    artifactTitle: this.modalTitle,
                    artifactDescription: this.modalDescription,
                    artifactImage: this.modalImage,
                    artifactID: this.modalID,
                    editID: this.modalEditID,
                    catagory: this.modalCatagory
                }).then(function(){
                    console.log('SUCCESS!!');
                }).catch(function(){
                    console.log('FAILURE!!');
                });
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

    .item {
        display: inline-block;
        padding:  .25rem;
        width:  100%;
    }

    .well {
        position:relative;
        display: block;
    }

</style>

