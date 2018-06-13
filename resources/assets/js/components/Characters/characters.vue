<template>
    <div id="characters" class="container">
        <h2>
            Meet the Team behind Microcore
        </h2>
        <div class="selected-character row">
            <img :src="selectedCharacter.img_large" class="img-large col-sm-4">
            <div class="about col-sm-7">
                <p> {{ selectedCharacter.name }}</p>
                <p> {{ selectedCharacter.role }}</p>
                <p> {{ selectedCharacter.about }} </p>
            </div>
        </div>
        <hr>
        <div class="row">
            <div v-for="character in characters" class="character col-sm-2" @click="selectCharacter(character)">
                <img :src="character.img_large" class="img-small">
                <p> {{ character.name }}</p>
                <p> {{ character.role }}</p>
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
        data: function(){
            return {
                selectedCharacter: null
            }
        },
        methods:{
            selectCharacter: function (character) {
                this.selectedCharacter = character;
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
    .character {
        cursor: pointer;
        background-color: white;
        margin: 2rem 3rem;
        text-align: center;
        height: 15rem;
        font-family: Raleway, sans-serif;
    }
    .character:hover {
        transform: scale(1.05);
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