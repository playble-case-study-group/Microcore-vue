<template>
    <div id="contact">
        <div v-for="person in contact" v-if="">
            <span id="name">Cool-guy McFly</span>
            <span id="position">Data Influencer</span>
            <img id="photo" src="">
            <span v-if="active.includes(person.charID)">ACTIVE</span>
        </div>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        props: ['contact'],
        computed:{
            active: function() {
                var temp = [];
                for (var x in this.contact) {
                    if (this.contact[x].day === this.contact[x].current_Day ) {
                        temp.push(this.contact[x].charID);
                    }
                }
                return temp;
            }

        },
        methods: {

        }
    }
</script>