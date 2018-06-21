<template>
    <div id="characters" class="container main">
        <h1 class="greeting">
            Meet the Team behind Microcore
        </h1>
        <div class="display">
            <div class="selected-character">
                <img :src="selectedCharacter.img_large" class="img-large col-sm-6">
                <div class="about col-sm-12">
                    <h2 class="sans-serif title"> {{ selectedCharacter.name }}</h2>
                    <p class="sans-serif role"> {{ selectedCharacter.role }}</p>
                    <p class="pre-formatted"> {{ selectedCharacter.about }} </p>
                </div>
            </div>
            <hr>
            <div class="listed-characters row">
                <div v-for="character in characters"
                     v-if="character.character_id == selectedCharacter.character_id ? selected='true' : selected='false'"
                     class="character col-sm-5"
                     :id="character.character_id"
                     @click="selectCharacter(character)">
                    <div class="character-inner">
                        <img :src="character.img_large" class="img-small">
                        <p class="character-name"> {{ character.name }}</p>
                        <p> {{ character.role }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        props: {
            characters: Array
        },
        created() {
            this.selectedCharacter = this.characters[0];
        },
        mounted() {
            let selected = '#' + this.selectedCharacter.character_id;
            $(selected).toggleClass(' active');
            this.previous = selected;
        },
        data: function(){
            return {
                selectedCharacter: null,
                previous: null
            }
        },
        methods:{
            selectCharacter: function (character) {
                $(this.previous).toggleClass(' active');
                this.selectedCharacter = character;
                let selected = '#' + character.character_id;
                this.previous = selected;
                $(selected).toggleClass(' active');
            }
        }
    }
</script>

<style scoped lang="scss">
    @import "../../../sass/_variables.scss";
    img {
        border-radius: 50%;
    }
    .pre-formatted {
        white-space: pre-line;
    }
    .greeting {
        text-align: center;
        margin-bottom: 60px;
        font-size: 32px;
    }
    .row {
        justify-content: center;
    }
    .sans-serif {
        font-family: Raleway, sans-serif;

    }
    .listed-characters {
        grid-column-start: 1;
        grid-row-start: 1;
        margin: auto;
        margin-top: 0;
    }
    .selected-character {
        grid-column-start: 2;
        grid-row-start: 1;
        padding: 40px;
    }
    #characters {
        margin: 0 40px;
        padding-top: 40px;
    }
    .display {
        display: grid;
        grid-template-columns: 50%;
        justify-items: center;
    }
    .character {
        cursor: pointer;
        margin: 1rem 1rem;
        text-align: center;
        height: 15rem;
        font-family: Raleway, sans-serif;
        box-shadow: 0 0 10px rgba(0,0,0,.19);
    }
    .character:hover, .active {
        transform: scale(1.1);
        transition: transform .25s;
        background-color: rgba(40, 167, 69, .75);
        color: white;
    }
    .character-inner {
        padding-top: 2.5rem;
    }
    .character-name {
        margin: 5px 0px;

        padding-top: 10px;
    }
    .role {
        border-bottom: 2px solid #ee6031;
    }
    .img-small {
        width: 50%;
        display: block;
        margin: auto;
    }
    .img-large {
        align-self: center;
    }
    .container {
        margin: 40px;
    }

</style>