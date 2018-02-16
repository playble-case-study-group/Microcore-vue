<template>
    <div id="contact">
        <div class="contact-inner" :id="person.charID" v-for="person in contact" v-on:click="chooseCharacter($event.target.parentElement.id)">
            <span id="name">Cool-guy McFly</span><br>
            <span id="position">Data Influencer</span><br>
            <img id="photo" src="">
            <span v-if="activeContacts.includes(person.charID)">ACTIVE</span><br>
        </div>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        props: ['contact', 'activeContacts'],
        computed:{
        },
        methods: {
            chooseCharacter(charID) {
                this.$store.commit('chooseCharacter', {charID});
            },
        }
    }
</script>