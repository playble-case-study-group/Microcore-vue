<template>
    <li class="nav-item" id="navigation">
        <a class="nav-link" href="/email">
            {{ this.title }}
            <span v-if="this.notifications > 0" class="badge badge-pill badge-danger">
                {{ this.notifications }}
            </span>
        </a>
    </li>
</template>

<script>
    import { mapGetters, mapActions } from 'vuex'
    export default {
        props: {
            title: String,
            notifications: Number
        },
        computed: mapGetters([
            'evenOrOdd'
        ]),
        methods: mapActions([
            'increment',
            'decrement',
            'incrementIfOdd',
            'incrementAsync'
        ])
    }
</script>
