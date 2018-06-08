<template>
    <div id="gallery" class="container-fluid">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <ul id="boardList">
                    <li><a href="#" @click="showAllGallery"><b>Show All</b></a></li>
                    <li v-for="(tag, key) in tags" :key="key">
                        <a href="#"
                           @click="filterGallery(tag)">
                            {{ tag.title }}
                        </a >
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <h1>{{ boardTitle }}</h1>
                <hr>
                <p class="no-artifacts d-none">There are no artifacts with the {{ boardTitle }} tag.</p>
                <div class="card-columns">
                    <div class="card"
                         v-for="artifact in gallery"
                         v-if="!artifact.hidden"
                         :key="artifact.artifact_id">
                        <img class="card-img-top"
                             @click="openArtifact(artifact)"
                             :src="artifact.image"
                             :alt="artifact.title">
                        <div class="card-img-overlay">
                            <button class="btn btn-default" @click="openArtifact(artifact)">
                                Add Tag
                            </button>
                            <!--<v-select v-model="newTag" label="title" :options="tags" :placeholder="'Add Tag'"></v-select>-->
                        </div>

                        <div class="card-body artifact" >
                            <h4 class="card-title" @click="openArtifact(artifact)">{{ artifact.title }}</h4>
                            <p class="card-text" @click="openArtifact(artifact)">{{ artifact.description}}</p>

                            <button v-for="tag in artifact.tags"
                                    type="button"
                                    @click="filterGallery(tag)"
                                    class="btn btn-primary tag-btn">
                                {{ tag.title }}
                            </button>
                        </div>

                    </div>
                </div>

                <artifact :artifactData="artifactData"
                          :tags="tags"
                          ref="openModal"
                          @saveArtifactChanges="saveArtifactChanges"
                          @nextArtifact="nextArtifact"
                          @previousArtifact="previousArtifact">
                </artifact>
            </div>
        </div>

    </div>
</template>

<script>

    import artifact from './Artifact.vue'


    export default {
        props: {
            gallery: Array,
            tags: Array
        },
        components: {
            'artifact': artifact
        },
        data: function(){
            return {
                boardTitle: "All Artifacts",
                groupArt: [],
                showModal: false,
                newTag: '',
                artifactData: {
                    id: 0,
                    editId: 0,
                    category: 0,
                    image: '',
                    title: '',
                    description: '',
                    tags: []
                },
                newTagModal: {}
            }
        },
        mounted() {
            this.$store.dispatch('CLEAR_GALLERY_NOTIFICATIONS');
        },
        methods: {
            nextArtifact: function () {
                let appScope = this;
                let curArtId = this.artifactData.artifact_id;
                let galleryLen = this.gallery.length;
                this.gallery.find( function (artifact, index) {
                    if (artifact.artifact_id === curArtId) {
                        (index + 1 === galleryLen) ? appScope.openArtifact(appScope.gallery[0]) : appScope.openArtifact(appScope.gallery[index + 1])
                    }
                })
            },
            previousArtifact: function () {
                let appScope = this;
                let curArtId = this.artifactData.artifact_id;
                let galleryLen = this.gallery.length;
                this.gallery.find( function (artifact, index) {
                    if (artifact.artifact_id === curArtId) {
                        (index - 1 === -1) ? appScope.openArtifact(appScope.gallery[galleryLen - 1]) : appScope.openArtifact(appScope.gallery[index - 1])
                    }
                })
            },
            showAllGallery: function () {
                this.boardTitle = "All Artifacts";
                this.gallery.forEach( artifact => { artifact.hidden = false });
                $('.no-artifacts').addClass('d-none');
                this.$forceUpdate();
            },
            filterGallery: function (tag) {
                let visibleArtifactCount = 0;
                this.gallery.forEach( artifact => {
                    if (!artifact.tags.find( art => { return art.tag_id === tag.tag_id })) {
                        artifact.hidden = true;
                    } else {
                        visibleArtifactCount++;
                        artifact.hidden = false;
                    }
                });
                console.log(visibleArtifactCount);
                if (!visibleArtifactCount) {
                    $('.no-artifacts').removeClass('d-none');
                } else {
                    $('.no-artifacts').addClass('d-none');
                }

                this.boardTitle = tag.title;
                this.$forceUpdate();
            },
            openArtifact: function(modalArtifact) {
                this.$refs.openModal.openModal();
                this.artifactData = modalArtifact;
            },
            addTag: function (artifact) {
                this.newTagModal = artifact;
                $('#addTagModal').modal()
            },
            saveArtifactChanges: function () {
                this.$forceUpdate()
            }
        }
    }
</script>

<style lang="scss" scoped>
    @import "../../../sass/variables";
    @import "../../../sass/mixins/breakpoints";

    .card-img-overlay {
        display: none;
        pointer-events:none;
    }

    .card-img-overlay .btn {
        pointer-events: auto;
    }

    .card:hover .card-img-overlay {
        display: block;
    }

    .card-columns {
        @include media-breakpoint-only(lg) {
            column-count: 3;
        }
        @include media-breakpoint-only(xl) {
            column-count: 4;
        }
        @include media-breakpoint-only(xxl) {
            column-count: 5;
        }
    }

    #boardList {
        margin: 50px 0;
        list-style: none;
        text-decoration: none;
        cursor: pointer;
        -webkit-columns: 100px 3; /* Chrome, Safari, Opera */
        -moz-columns: 100px 3; /* Firefox */
        columns: 100px 3;
    }

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
        margin-bottom: 10px;
    }

    .card-text, .card-title, .card-img-top {
        cursor: pointer;
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

