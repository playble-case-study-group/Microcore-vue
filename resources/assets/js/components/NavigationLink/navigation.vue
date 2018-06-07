<template>
    <li class="nav-item" id="navigation">
        <a class="nav-link" :href="link">
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
