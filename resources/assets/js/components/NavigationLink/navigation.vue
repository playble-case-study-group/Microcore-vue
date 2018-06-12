<template>
    <li class="nav-item" id="navigation">
        <a class="nav-link" :href="link">
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
        props: {
            title: String,
            link: String,
            notifications: Number
        },
    }
</script>

<style scoped>
    .nav-icon {
        position: relative;
        top: -2px;
        padding-right: 5px;
    }
</style>
