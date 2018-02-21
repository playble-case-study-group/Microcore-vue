import Vue from 'vue'
import Vuex from 'vuex'


Vue.use(Vuex);


const state = {
    tasks: [],
    user: {},
    simulation: {}
}

const getters = {
    CURRENT_TASKS: (state) => {
        console.log("TASKS: ", state.tasks.filter(task => task.day === state.user.current_day));
        return state.tasks.filter(task => task.day === state.user.current_day);
    },
    TASKS_BY_DAY: (state) => {
        return _.groupBy(state.tasks, 'day');
    }
}

const mutations = {

    // Retrieves global information about the simulation
    GET_SIMULATION: (state) => {
        axios.get('/sim').then(response => {
            state.simulation = response.data[0];
        })
    },

    // Retrieves tasks from database when the application loads
    // See app.js mounted for call
    GET_TASKS: (state) => {
        axios.get('/tasks').then(response => {
            state.tasks = response.data;
        });
    },

    // Retrieves user from database when appliction loads.
    // See app.js mounted for call
    GET_USER: (state) => {
        axios.get('/auth').then(response => state.user = response.data);
    },

    // Increments day in user object while it is less than the amount of days
    // Consider making a simulation table with basic data like how many days there are in the simulation...
    NEXT_DAY: (state) => {
        if (state.user.current_day < state.simulation.days) {
            axios.post('/nextday', {id: state.user.id})
                .then((response) => {
                    console.log(response)
                }).catch(error => {
                    console.log(error.response.data)
            })
            state.user.current_day++;
        }
    },
    toggleTask: (state, payload) => {
        //console.log(payload)
        let task = state.tasks.find(task => task.id === payload);
        task.complete = !task.complete;
        axios.post('/tasks/complete', {id: payload, complete: task.complete})
            .then((response) => {
                console.log(response)
            }).catch((error) => {
                console.log(error.response.data)
        })
    }
}

const actions = {
    GET_SIMULATION: ({commit}) => commit('GET_SIMULATION'),
    GET_TASKS: ({commit}) => commit('GET_TASKS'),
    GET_USER: ({commit}) => commit('GET_USER'),
    NEXT_DAY: ({commit}) => commit('NEXT_DAY'),
    toggleTask(context, payload) {
        context.commit('toggleTask', payload)
    }
}

export default new Vuex.Store({
    state,
    getters,
    mutations,
    actions
})


