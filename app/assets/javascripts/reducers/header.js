const initialState = {
    styles: {}
};


const header = (state = initialState, action) => {
    switch (action.type) {
        case 'SET_HEADER_OPTIONS':
            return Object.assign({}, state, {
                styles: action.options
            });
        case 'GET_HEADER_OPTIONS':
            return state.header || state;
        default:
            return state;
    }
};

export default header;