<template>
    <div class="container main" id="library">
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
            <div class="col-sm-8 col-md-9" id="content-container">
                <vue-markdown :source="currentContent"
                              :toc="true"
                              :toc-id="currentTitle"
                              :toc-anchor-link="false"
                              v-on:toc-rendered="receiveToc">
                </vue-markdown>
            </div>
        </div>


    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'
    import VueMarkdown from 'vue-markdown'


    export default {

        mounted() {
            console.log('Component mounted.')
            this.getAllToc();
        },
        components: {
            "vue-markdown": VueMarkdown

        },
        props: ['wiki'],
        data: function () {
            return {

                currentTitle:"",
                currentContent:"",
                currentLang:"spanish",
                currentArticle: 1,
                languages: ['spanish']
            }
        },
        methods: {
            showContent: function (id) {
                let content = this.wiki.find( title => title.id == id);

                this.currentTitle = content[this.currentLang].title;
                this.currentContent = content[this.currentLang].content;
                this.currentArticle = id;

            },
            changeLang: function (lang) {
                this.currentLang = lang;
                this.showContent(this.currentArticle);

            },
            getAllToc: function() {
                for(let article in this.wiki){
                    let single = this.wiki[article];
                    let appScope = this;

                    setTimeout(function(){
                        appScope.currentTitle = single.spanish.title;
                        appScope.currentContent = single.spanish.content;
                        appScope.currentArticle = single.id;
                      }, 100);
                }
            },
            receiveToc: function (tocHtmlStr) {
                let title = "#title-" + this.currentArticle;

                if( $(title).children().length <= 0 ) {
                    $(title).append(tocHtmlStr);
                    $('ul').css('list-style-type', 'none');
                    $('li > a').css('color', '#636b6f');
                    $('ul > li').css('margin-left', '-10px');
                }
            }

        }
    }
</script>

<style scoped lang="scss">
    @import "../../../sass/_variables.scss";
    .menubtn {
        cursor:pointer;
        margin-bottom: 3rem;
    }
    .article-title:hover{
        text-decoration: underline;
    }
    #library {
        margin-top: 0px;
        box-shadow: 0px -6px 10px;
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
        padding-top: 20px;

    }
    #content-container h1 {
        margin-top: 0px;
    }

</style>
