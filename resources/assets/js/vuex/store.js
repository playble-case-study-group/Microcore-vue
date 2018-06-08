import Vue from 'vue'
import Vuex from 'vuex'


Vue.use(Vuex);


const state = {
    tasks: [],
    user: {},
    simulation: {},
    notifications: {

        newEmails: 0,
        newArtifacts: 0,
    }
}

const getters = {
    CURRENT_TASKS: (state) => {
        // console.log("TASKS: ", state.tasks.filter(task => task.day === state.user.current_day));
        return state.tasks.filter(task => task.day === state.user.current_day);
    },
    DAY_TASKS_COMPLETE: (state) => {
        console.log(state.tasks);
        let tasks = state.tasks.filter(task => task.day === state.user.current_day);
        console.log(tasks);
        tasks.filter(task => task.complete == false);
    },
    TASKS_BY_DAY: (state) => {
        return _.groupBy(state.tasks, 'day');
    },
    CURRENT_DAY: (state) => {
        return state.user.current_day;
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
        axios.get('/user').then(response => state.user = response.data).catch( error => console.log(error));
    },


    // Increments day in user object while it is less than the amount of days
    // Consider making a simulation table with basic data like how many days there are in the simulation...
    NEXT_DAY: (state) => {
        if (state.user.current_day < state.simulation.days) {
            state.user.current_day++;
            axios.post('/updateday', {id: state.user.user_id, day: state.user.current_day})
                .then((response) => {
                    // console.log(response)
                })
                .catch(error => {
                    console.log(error.response.data)
                })
            window.location.href = '/dashboard';
        }
    },
    PREVIOUS_DAY: (state) => {
        axios.post('/resetDay', {id: state.user.user_id, day: state.user.current_day})
            .then(response => {
                 console.log(response)
            })
            .catch( error => {
                console.log(error.response.data)
            })
        if(state.user.current_day > 1) {
            state.user.current_day--;
        }
        window.location.reload();
    },
    toggleTask: (state, payload) => {
        console.log(payload)
        let task = state.tasks.find(task => task.task_id === payload);
        task.complete = !task.complete;
        axios.post('/tasks/complete', {id: payload, complete: task.complete})
            .then((response) => {
                //console.log(response)
            }).catch((error) => {
                console.log(error.response.data)
        })
    },
    RETRIEVE_NEW_EMAILS: (state) => {
        axios.post('/getemailnotifications')
            .then( response => {
                state.notifications.newEmails = response.data; //this is the problem line
        }).catch(err =>console.log(err))
    },
    RETRIEVE_NEW_ARTIFACTS: (state) => {
            axios.post('/getgallerynotifications')
                .then(response => {
                    state.notifications.newArtifacts = response.data;
                }).catch(err => console.log(err))
    },
    CLEAR_GALLERY_NOTIFICATIONS: (state) => {
        axios.post('/visitedgallery')
            .then(response => {
                state.notifications.newArtifacts = 0;
            }).catch(err => console.log(err))
    }
}

const actions = {
    GET_SIMULATION: ({commit}) => commit('GET_SIMULATION'),
    GET_TASKS: ({commit}) => commit('GET_TASKS'),
    GET_USER: ({commit}) => commit('GET_USER'),
    GET_NOTES: ({commit}) => commit('GET_NOTES'),
    NEXT_DAY: ({commit}) => commit('NEXT_DAY'),
    PREVIOUS_DAY: ({commit}) => commit('PREVIOUS_DAY'),
    toggleTask(context, payload) {
        context.commit('toggleTask', payload)
    },
    RETRIEVE_NEW_EMAILS: ({commit}) => commit('RETRIEVE_NEW_EMAILS'),
    RETRIEVE_NEW_ARTIFACTS: ({commit}) => commit('RETRIEVE_NEW_ARTIFACTS'),
    CLEAR_GALLERY_NOTIFICATIONS: ({commit}) => commit('CLEAR_GALLERY_NOTIFICATIONS')
}

export default new Vuex.Store({
    state,
    getters,
    mutations,
    actions
})


