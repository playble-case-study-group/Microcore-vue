<template>
    <li class="nav-item" id="navigation">
        <a :class="isActive == link ? 'nav-link ' + 'active' : 'nav-link'" :href="link" >
            <img :src=" isActive == link ? '/img/TOP'+ link +'-icon-selected.png' : '/img/TOP'+ link +'-icon.png'" :alt="link" class="nav-icon">
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
        padding-right: 2 px;
    }
    .active{
        font-weight: bold;
    }
</style>
