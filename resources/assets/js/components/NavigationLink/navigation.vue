<template>
    <li class="nav-item" id="navigation">
        <a :class="isActive == link ? 'nav-link ' + 'active' : 'nav-link'" :href="link" >
<<<<<<< HEAD
            <img :src=" isActive == link ? '/img/TOP'+ link +'-icon-selected.png' : '/img/TOP'+ link +'-icon.png'" :alt="link" class="nav-icon">
=======
            <img :src=" isActive == link ? '/img/TOP'+ link +'-icon-selected.svg' : '/img/TOP'+ link +'-icon.svg'" :alt="link" class="nav-icon">
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6
            <span class="nav-icon"><slot name="nav-icon" ></slot></span>
            {{ title }}
            <span v-if="notifications > 0" class="badge badge-pill badge-danger">
                {{ notifications }}
            </span>
        </a>
    </li>
</template>

<script>
    import { mapGetters, mapActions } from 'vuex'
    export default {
        mounted() {
          this.getActivePath();
        },
        props: {
            title: String,
            link: String,
            notifications: Number
        },
        data: function() {
            return {
                isActive: ''
            }
        },
        methods: {
            getActivePath: function() {
                this.isActive = window.location.pathname;
            }
        }

    }
</script>

<style scoped>
    .nav-link {
        text-transform: uppercase;
        font-family: "Raleway", sans-serif;
    }
    .nav-icon {
        position: relative;
        top: -2px;
<<<<<<< HEAD
        padding-right: 2 px;
    }
    .active{
        font-weight: bold;
=======
        padding-right: 5px;
    }
    .badge-danger {
        background-color: #942921;
    }
    .active{
        color: #942921 !important;
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6
    }
</style>
