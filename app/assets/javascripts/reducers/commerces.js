const initialState = {
    types: {},
    filters: {
        states: {},
        cities: {}
    }
};


const commerces = (state = initialState, action) => {
    switch (action.type) {
        case 'SET_COMMERCES_TYPE':
            return Object.assign({}, state, {
                types: action.types,
                filters: {
                    states: {},
                    cities: {}
                }
            });
        case 'SET_STATES_FILTER':
            return Object.assign({}, state, {
                filters: {
                    states: action.states,
                    cities: {}
                }
            });
        case 'SET_CITIES_FILTER':
            return Object.assign({}, state, {
                filters: {
                    ...state.filters,
                    cities: action.cities
                }
            });
        default:
            return state;
    }
};

export default commerces;