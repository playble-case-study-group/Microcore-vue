<template>
    <div id="students-component">
        <table class="table">
            <thead>
                <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Day</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="student in students">
                    <td>{{ student.name }}</td>
                    <td>{{ student.email }}</td>
                    <td>{{ student.current_day }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
    import { mapGetter, mapActions } from 'vuex'

    export default {

        mounted() {
            console.log('Component mounted.')
        },
        props: ['students'],
        methods: mapActions([
            'toggleTask'
        ])
    }
</script>
