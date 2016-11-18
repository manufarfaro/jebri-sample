const initialState = {
    family: {},
    selected: {}
};


const products = (state = initialState, action) => {
    switch (action.type) {
        case 'SET_PRODUCT_FAMILY':
            return Object.assign({}, state, {
                family: action.family
            });
        case 'SET_PRODUCT':
            return Object.assign({}, state, {
                selected: action.selected
            });
        default:
            return state;
    }
};

export default products;