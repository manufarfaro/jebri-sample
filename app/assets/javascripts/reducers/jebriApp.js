import { combineReducers } from 'redux';
import header from './header';
import products from './products';
import commerces from './commerces';
import { routerReducer } from 'react-router-redux';

const jebriApp = combineReducers({
    header: header,
    products: products,
    commerces: commerces,
    routing: routerReducer
});

export default jebriApp;
