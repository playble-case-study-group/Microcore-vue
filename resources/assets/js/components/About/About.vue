<template>
    <div id="characters" class="container main">
        <div class="display">
            <h1 class="greeting">
                <img class="logo" src="img/about4.jpg">
            </h1>
            <div class="text-container">
            <h2 class="orange-heading">Our History</h2>
            <p>
                Microcore was founded in 2002 by CEO Eric Johnson as a way to make the benefits of nanotechnology accessible to the medical industry. Driven by a commitment to excellence and creativity, Microcore strives to adapt the world's most advanced and innovative technologies to the medical industry for optimal patient care.
<br><br>
                The nanotechnology around which Microcore was built is both versatile and robust. Nanobots are used in many different industries, from aerospace to construction, but it was not until Microcore's founding that this impressive technology was tailored and applied to the medical field.

<br><br>
                Since Microcore's beginning, we’ve continued to innovate, expand, and improve. Today, Mircocore researches and manufactures different types of nanobots that target specific ailments, helping to accelerate patient recovery and enhance care.
            </p>
            <h2 class="orange-heading">Our Products</h2>
                <img class="col-sm-5 nanobot" src="img/Virus3.png">
            <p>
                The TNG-3.01®Nanobot was originally patented by Microcore in 2005 to help reduce recovery time for patients by 1/3 through mimicking the regeneration and growth of human tissue. The TNG-3.01® continues to be one of our most revolutionary products along with YT-1301® and YT-2600®, which are used for treating various forms of cancer.
<br><br>
                Today, Microcore is working on the finishing stages of a 10 year research project for a nanobot, the MCT-8472®, designed to substantially increase the rate of healing for broken bones through replicating and bonding to human bone.

            </p>
            <h2 class="orange-heading">Our Commitment</h2>
            <p>
                With a robust research and development arm, Microcore is committed to continue looking for innovative ways to bring nanotechnology to bear on the world's toughest illnesses. At Microcore, our highest value is the well-being of patients around the world, and it is our commitment to them that drives us to strive for the best medical solutions in the world.
            </p>
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
    .logo {
        width: 100%;
        height: 100%;
    }
    .row {
        justify-content: center;
    }
    .sans-serif {
        font-family: Raleway, sans-serif;
    }
    .orange-heading {
        color: #d35e31;
    }
    .display {
        max-width: 1024px;
        margin: auto;
    }
    .text-container {
        margin: 80px;
    }
    .nanobot{
        float: right;
    }
    .quote {
        float: left;
    }


</style>