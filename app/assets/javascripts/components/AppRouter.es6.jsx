import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import jebriApp from '../reducers/jebriApp';
import App from './App.es6.jsx';
import IndexContainer from '../containers/IndexContainer';
import { syncHistoryWithStore } from 'react-router-redux';

let store = createStore(jebriApp, window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__());
/*
let unsubscribe = store.subscribe(() =>
    console.log(store.getState())
);
*/
const history = syncHistoryWithStore(browserHistory, store);

export default class AppRouterComponent extends React.Component {
    render () {
        return (
            <Provider store={store}>
                <Router history={history}>
                    <Route path="/" component={App}>
                        <IndexRoute component={IndexContainer} />
                        <Route path="empresa" component={IndexContainer} />
                        <Route path="productos" component={IndexContainer} />
                        <Route path="faq" component={IndexContainer} />
                        <Route path="donde-comprar" component={IndexContainer} />
                        <Route path="servicio-tecnico" component={IndexContainer} />
                    </Route>
                </Router>
            </Provider>
        )
    }
}

ReactDOM.render(<AppRouterComponent />, document.getElementById("root"));