<template>
    <div class="container main" id="editor">
        <div class="row">
            <div class="col-sm-4 col-md-3" id="libraryMenu">
                <!-- <div :class="['btn-group', 'd-none', 'd-sm-block', 'd-md-none']" role="group" aria-label="..." v-for="lang in languages">
                    <button type="button" :class="['btn', currentLang == lang ? 'btn-invert' : 'btn-default']" @click="changeLang(lang)">{{ lang.charAt(0).toUpperCase() + lang.slice(1) }}</button>
                </div>-->
                <h1>menu</h1>
                <br>
                <div v-for="article in wiki" @click="showContent(article.id)" class="menubtn" >
                    <h4 class="article-title">{{article[currentLang].title}}</h4>
                    <p :id="'title-' + article.id">

                    </p>
                </div>
            </div>
            <form>
                <textarea class="col-sm-8 col-md-9" id="content-container" v-model="currentContent" @keyup="setTime">
                </textarea>
            </form>

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
                currentTitle: ":)",
                currentContent: "Select an Article",
                currentLang: "spanish",
                //currentArticle is the language specific article. This gets populated from the article table
                currentArticle: 1,
                //currentPair is an object containing a pair of articles. These objects come from the wiki table. Notice that the naming can eb confusing.
                currentPair: 1,
                languages: ['english', 'spanish'],
                timeout: null
            }
        },
        methods: {
            showContent: function (id) {
                let content = this.wiki.find( title => title.id == id);

                this.currentTitle = content[this.currentLang].title;
                this.currentContent = content[this.currentLang].content;
                this.currentArticle = content[this.currentLang].id;
                this.currentPair = id;

            },
            changeLang: function (lang) {
                this.currentLang = lang;
                this.showContent(this.currentPair);

            },
            updateArticle: function () {
                let content = this.wiki.find( title => title.id == this.currentPair);
                content[this.currentLang].content = this.currentContent;

                let data = {
                    id: this.currentArticle,
                    content: this.currentContent
                };
                //notice that this axios response will post to the current article, not the current wiki.

                axios.put("/editor/" + this.currentArticle, data).then(response => {
                    console.log(response.data)
                })

            },
            setTime: function () {

                //use this to adjust how long it takes to make an update in the database. The program will wait for a pause in typing.
                clearTimeout(this.timeout);
                this.timeout = setTimeout(this.updateArticle, 500);


            }
        },
    }
</script>

<style scoped>
    .menubtn {
        cursor:pointer;
        margin-bottom: 3rem;

    }
    .article-title:hover{
        text-decoration: underline;
    }
    #editor {
        background-color: white;
        margin-left: 40px;
        box-shadow: 2px 1px 2px;
    }
    #libraryMenu {
        height: 100vh;
        padding-top: 20px;
        padding-left: 40px;
        box-shadow: inset -7px 0 9px -10px rgba(0,0,0,0.4);
    }

    #content-container {
        padding-right: 80px;
        padding-left: 40px;
        padding-top: 40px;
        resize: none;
        border:none;
        height: 100%;
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

