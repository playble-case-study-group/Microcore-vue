<template>
    <div id="about" class="container">
        <h2>
            Meet the Team behind Microcore
        </h2>
        <div class="row">
            <div v-for="character in characters"
                 :key="character.character_id"
                 :id="character.character_id"
                 class="character col-sm-5"
                 @click="selectCharacter(character)">
                <span :class="'not-selected not-selected-' + character.character_id">
                    <img :src="character.img_large" class="img-large">
                    <span class="character-info">
                        <p> {{ character.name }}</p>
                        <p> {{ character.role }}</p>
                    </span>
                </span>
                <span :class="'selected selected-' + character.character_id">
                    <p> {{ character.about }} </p>
                </span>
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
          $('.selected').hide();
        },
        data: function(){
            return {
                selectedCharacter: null
            }
        },
        methods:{
            selectCharacter: function (character) {
                this.selectedCharacter = character;
                let notSelected = '.not-selected-' + character.character_id;
                let selected = '.selected-' + character.character_id;
                $(selected).slideToggle();
                $(notSelected).slideToggle();
            }
        }
    }
</script>

<style scoped lang="scss">
    @import "../../../sass/_variables.scss";
    .row {
        justify-content: center;
    }
    .character {
        background-color: white;
        margin: 2rem 1rem;
        padding: 0;
        cursor: pointer;
    }
    .not-selected {
        display: inline-block;
        width: 100%;
        overflow: hidden;
        position: relative;
    }
    .not-selected:hover > .character-info {
        -moz-transition: all .2s ease-out;
        -o-transition: all .2s ease-out;
        -webkit-transition: all .2s ease-out;
        transition: all .2s ease-out;
        background-color: #28a745;
        color: white;
    }
    .img-large {
        display: block;
        margin: auto;
    }
    .character-info {
        display: block;
        height: max-content;
        text-align: center;
        font-family: "Raleway", sans-serif;
    }
    .container {
        margin: 40px;
    }
    .selected {
        padding: 20px;
        background-color: #28a745;
        color: white;
        display: block;
        overflow: hidden;
        position: relative;
    }

</style>