<template>
    <li class="clearfix">
        <img :src="user.img" alt="avatar" />
        <div class="about">
            <div class="name">{{ user.name }}</div>
            <div class="status">
                <i class="fa fa-circle online"></i> {{ user.status }}
            </div>
        </div>
    </li>
</template>

<script>
    export default {

        mounted() {
//            console.log('Component mounted.')
        },
        props: ['user']

    }
</script>
