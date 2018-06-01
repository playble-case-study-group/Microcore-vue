<template>
    <li class="clearfix">
        <img :src="channel.img" alt="avatar" />
        <div class="about">
            <div class="name">{{ channel.name }}</div>
            <div class="status">
                <i class="fa fa-circle online"></i> {{ channel.status }}
            </div>
        </div>
    </li>
</template>

<script>
    export default {

        mounted() {
//            console.log('Component mounted.')
        },
        props: ['channel']

    }
</script>
