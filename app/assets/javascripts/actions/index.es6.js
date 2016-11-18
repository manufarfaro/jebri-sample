export function setHeaderOptions(options) {
    return {
        type: 'SET_HEADER_OPTIONS',
        options
    }
}

export function getHeaderOptions() {
    return {
        type: 'GET_HEADER_OPTIONS'
    }
}

export function setProductFamily(family){
    return {
        type: 'SET_PRODUCT_FAMILY',
        family
    }
}

export function setProduct(selected){
    return {
        type: 'SET_PRODUCT',
        selected
    }
}

export function setCommercesType(types){
    return {
        type: 'SET_COMMERCES_TYPE',
        types
    }
}

export function setStatesFilter(states){
    return {
        type: 'SET_STATES_FILTER',
        states
    }
}

export function setCitiesFilter(cities){
    return {
        type: 'SET_CITIES_FILTER',
        cities
    }
}