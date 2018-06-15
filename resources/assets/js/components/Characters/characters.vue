<template>
    <div id="characters" class="container">
        <h2>
            Meet the Team behind Microcore
        </h2>
        <div class="selected-character row">
            <img :src="selectedCharacter.img_large" class="img-large col-sm-4">
            <div class="about col-sm-6">
                <h2 class="sans-serif title"> {{ selectedCharacter.name }}</h2>
                <p class="sans-serif"> {{ selectedCharacter.role }}</p>
                <p> {{ selectedCharacter.about }} </p>
            </div>
        </div>
        <hr>
        <div class="row">
            <div v-for="character in characters"
                 v-if="character.character_id == selectedCharacter.character_id ? selected='true' : selected='false'"
                 class="character col-sm-2"
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
    .row {
        justify-content: center;
    }
    .sans-serif {
        font-family: Raleway, sans-serif;

    }
    .character {
        cursor: pointer;
        background-color: white;
        margin: 2rem 1.5rem;
        text-align: center;
        height: 15rem;
        font-family: Raleway, sans-serif;
    }
    .character:hover, .active {
        transform: scale(1.15);
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