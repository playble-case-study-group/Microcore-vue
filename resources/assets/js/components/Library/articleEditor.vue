<template>
    <div class="container main" id="editor">
        <div class="row">
            <div class="col-sm-4 col-md-3" id="libraryMenu">
                <!-- can be used to toggle multiple different language -->
                <!-- <div :class="['btn-group', 'd-none', 'd-sm-block', 'd-md-none']" role="group" aria-label="..." v-for="lang in languages">
                    <button type="button" :class="['btn', currentLang == lang ? 'btn-invert' : 'btn-default']" @click="changeLang(lang)">{{ lang.charAt(0).toUpperCase() + lang.slice(1) }}</button>
                </div>-->
                <h1>menu</h1>
                <br>
                <div v-for="article in wiki"
                     :key="article.id"
                     @click="showContent(article.id)"
                     class="menubtn" >

                    <h4 class="article-title">{{article.title}}</h4>
                    <p :id="'title-' + article.id">

                    </p>
                </div>
                <button class="btn btn-success" data-toggle="modal" data-target="#articleModal">Add Article</button>
            </div>
            <form class="col-sm-8 col-md-9">
                <button class="btn btn-danger delete" v-if="currentArticleId != 1" @click="deleteArticle" >Delete Article</button>
                <textarea id="content-container" v-model="currentContent" @keyup="setTime">
                </textarea>
            </form>

        </div>

        <!-- Add Article Modal -->
        <div class="modal fade" id="articleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Reset Current Day?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Article Title</label>
                                <input type="text" v-model="addedTitle" class="form-control" id="recipient-name">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" @click="addArticle">Submit</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        props: ['wiki'],
        data: function () {
            return {
                currentTitle: "",
                currentContent: "Select an Article",
                //currentLang: "spanish",
                //currentArticleId is the language specific article. This gets populated from the article table
                currentArticleId: 1,
                //currentPair is an object containing a pair of articles. These objects come from the wiki table. Notice that the naming can be confusing.
                //currentPair: 1,
                //languages: ['english'],
                timeout: null,
                addedTitle: ''
            }
        },
        methods: {
            showContent: function (id) {
                let content = this.wiki.find( title => title.id == id);

                this.currentTitle = content.title;
                this.currentContent = content.content;
                this.currentArticleId = content.id;
                this.currentPair = id;

            },
            /*changeLang: function (lang) {
                this.currentLang = lang;
                this.showContent(this.currentPair);

            },*/
            updateArticle: function () {
                let content = this.wiki.find( title => title.id == this.currentPair);
                content.content = this.currentContent;

                let data = {
                    id: this.currentArticleId,
                    content: this.currentContent
                };

                //notice that this axios response will post to the current article, not the current wiki.
                axios.put("/editor/" + this.currentArticleId, data).then(response => {
                    console.log(response.data)
                })

            },
            setTime: function () {

                //use this to adjust how long it takes to make an update in the database. The program will wait for a pause in typing.
                clearTimeout(this.timeout);
                this.timeout = setTimeout(this.updateArticle, 500);


            },
            deleteArticle: function() {
                let id = this.currentArticleId;
                axios
                    .post( "/deleteArticle",
                        {
                            article_id: id
                        }
                    )
                    .then(r => console.log(r))
                    .catch(e => console.log(e));
            },
            addArticle: function() {
                let title = this.addedTitle;
                axios
                    .post( "/addArticle",
                        {
                            article_title: title
                        }
                    )
                    .then(r => {
                        console.log(r);
                        this.addedTitle = '';
                        window.location.reload();
                    })
                    .catch(e => console.log(e));
            }
        },
    }
</script>

<style scoped>
    .menubtn {
        cursor:pointer;
        margin-bottom: 2rem;

    }
    .article-title:hover{
        text-decoration: underline;
    }
    .delete {
        float: right;
        margin-top: 40px;
        margin-right: 20px;
    }
    #editor {
        background-color: white;
        margin-left: 40px;
    }
    #libraryMenu {
        height: 100vh;
        padding-top: 40px;
        padding-left: 40px;
        box-shadow: inset -7px 0 9px -10px rgba(0,0,0,0.4);
    }

    #content-container {
        margin-top: 20px;
        padding-right: 80px;
        padding-left: 40px;
        resize: none;
        border:none;
        height: 100%;
        width: 100%;
        height: fit-content;
        height: -moz-available;          /* WebKit-based browsers will ignore this. */
        height: -webkit-fill-available;  /* Mozilla-based browsers will ignore this. */
    }
    #content-container h1 {
        margin-top: 0px;
    }
    .main{
        margin-top: 0px;
    }
    .row{
        margin: 0px;
    }

</style>

