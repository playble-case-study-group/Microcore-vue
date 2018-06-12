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
        let tasks = state.tasks.filter(task => task.day === state.user.current_day);
        tasks = tasks.filter(task => task.complete == false);
        if (tasks.length) {
            return false;
        } else {
            return true;
        }
    },
    GET_NEW_EMAILS: (state) => {
        return state.notifications.newEmails;
    },
    GET_NEW_ARTIFACTS: (state) => {
        return state.notifications.newArtifacts;
    },
    TASKS_BY_DAY: (state) => {
        return _.groupBy(state.tasks, 'day');
    },
    CURRENT_DAY: (state) => {
        return state.user.current_day;
    },

}

const mutations = {

    // Retrieves global information about the simulation
    SET_SIMULATION: (state) => {
        axios.get('/sim').then(response => {
            state.simulation = response.data[0];
        })
    },
// Retrieves tasks from database when the application loads
    // See app.js mounted for call
    SET_TASKS: (state, tasks) => {
        // axios.get('/tasks').then(response => {
            state.tasks = tasks;
        // });
    },

    // Retrieves user from database when appliction loads.
    // See app.js mounted for call
    SET_USER: (state) => {
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
    TOGGLE_TASK: (state, payload) => {
        let task = state.tasks.find(task => task.task_id === payload);

        console.log(task.complete);
        if(task.complete == true){
            console.log('change to false')
            task.complete = false;
            return;
        }
        if(task.complete == false){
            console.log('change to true')
            task.complete = true;
            return;
        }
        console.log(task.complete);
    },
    UPDATE_NEW_EMAILS: (state, newEmails) => {
        console.log("mutation: ", newEmails);
        state.notifications.newEmails = newEmails; //this is the problem line
    },
    SET_NEW_ARTIFACTS: (state) => {
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
    SET_SIMULATION: ({commit}) => commit('SET_SIMULATION'),
    SET_TASKS: ({commit}) => {
        axios.get('/tasks')
            .then(r => r.data)
            .then(tasks => {
                commit('SET_TASKS', tasks)
            });
        return;
    },
    SET_USER: ({commit}) => commit('SET_USER'),
    SET_NEW_EMAILS: ({commit}) => {
        axios.post('/getemailnotifications')
            .then( response => {
                console.log('action: ', response.data);
                commit('UPDATE_NEW_EMAILS', response.data);
            })
            .catch(err =>console.log(err));

    },
    SET_NEW_ARTIFACTS: ({commit}) => commit('SET_NEW_ARTIFACTS'),
    NEXT_DAY: ({commit}) => commit('NEXT_DAY'),
    PREVIOUS_DAY: ({commit}) => commit('PREVIOUS_DAY'),
    TOGGLE_TASK(context, payload) {
        axios.post('/tasks/complete', {id: payload})
            .then((response) => {
                context.commit('TOGGLE_TASK', payload)
            }).catch((error) => {
                console.log(error.response)
            });
    },
    CLEAR_GALLERY_NOTIFICATIONS: ({commit}) => commit('CLEAR_GALLERY_NOTIFICATIONS')
}

export default new Vuex.Store({
    state,
    getters,
    mutations,
    actions
})


