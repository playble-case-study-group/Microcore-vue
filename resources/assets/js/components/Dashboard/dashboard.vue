<template>
    <div id="dash" class="container">
        <div class="row">
            <div class="d-flex">
                <div class="dash-card dash-small">
                    <h3 class="dash-heading">Stock</h3>
                    <div class="dash-stocks">
                        <p class="dash-count">${{ this.dash.stock_value }}</p>
                        <hr>
                        <p class="dash-count"><i class="material-icons dash-stockStatus">{{ this.stockIconStatus }}</i>{{ this.dash.stock_percentage }}%</p>
                    </div>
                </div>
                <div class="dash-card dash-small">
                    <h3 class="dash-heading">News</h3>
                    <div class="dash-content">
                        <h4>{{ this.dash.news_headline }}</h4>
                        <p>{{ this.dash.news_snippet }}</p>

                    </div>
                </div>
                <div class="dash-card dash-small">
                    <h3 class="dash-heading">Updates</h3>
                    <div class="dash-content">
                        <i class="material-icons dash-notify">priority_high</i>
                        <span class="dash-update">{{ this.dash.message_count }} Unread Messages</span><br>
                        <i class="material-icons dash-notify">priority_high</i>
                        <span class="dash-update"> {{ this.dash.email_count }} Unread Emails</span>
                    </div>
                </div>
                <div class="dash-card dash-big">
                    <h3 class="dash-heading">Daily News</h3>
                    <video class="dash-video" poster="/img/videocall/video-placeholder.jpg" controls>
                        <source :src="this.dash.day_video" type="video/mp4">
                    </video>
                </div>
                <div class="dash-card dash-med">
                    <h3 class="dash-heading">Notes</h3>
                    <textarea class="dash-content" v-model="note" v-on:keyup="postUpdatedNote"></textarea>
                </div>
           </div>
        </div>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        props: ['dash', 'notes'],
        mounted() {
            console.log('Component mounted.')
            this.changeStockCSS();
        },
        data: function(){
            return {
                note: this.notes.note,
                stockIconStatus: 'arrow_upward'
            }
        },
        methods:{
            changeStockCSS: function(){
                if(this.dash.stock_status == 'down'){
                    $('.dash-stocks').css('color', '#ce0d0d');
                    this.stockIconStatus = 'arrow_downward';
                } else {
                    $('.dash-stocks').css('color', '#27ae60');
                    this.stockIconStatus = 'arrow_upward'
                }
            },
            postUpdatedNote: function () {
                axios
                    .post(
                        "/videocall",
                        {
                            note: this.note,
                            user: this.$store.state.user.id,
                        }
                    )
                    .then(r => console.log(r))
                    .catch(e => console.log(e));
            },
        }
    }
</script>

<style scoped lang="scss">
    @import "../../../sass/_variables.scss";
    .d-flex{
        display: flex;
        flex-flow: column-reverse;
        flex-wrap: wrap;
    }
    .dash-card{
        background-color: white;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        margin-top: 2rem;
    }
    .dash-small{
        height: 200px;
        width: 325px;
        margin-top: 10rem;
    }
    .dash-med{
        height: 500px;
        width: 325px;
    }
    .dash-big{
        height: 500px;
        width: 660px;
    }
    .dash-heading{
        color: $sim-heading;
        text-align: center;
    }
    .dash-content{
        margin: 3rem;
    }
    .dash-video{
        height: 425px;
        width: 600px;
        display: block;
        margin: auto;
    }
    .dash-notify{
        color: #ce0d0d;
        font-size: 20px;

    }
    .dash-stocks{
        display: flex;
        margin: 0 4rem;
        font-size: 27px;
    }
    .dash-stockStatus{
        font-size: 24px;
    }
    .dash-count{
        margin-top: 4rem;
    }
    .dash-update{
        position: absolute;
        margin-top: 4px;
    }
    hr{
        width: 1px;
        height: 100px;
        background-color: $sim-heading;
    }
    textarea{
        width: 275px;
        height: 400px;
        border:none;
        resize:none;
    }
    @media(min-width:992px){
        .d-flex{
            flex-flow: initial;
            justify-content: space-evenly;
            flex-wrap: wrap;
        }
    }

</style>