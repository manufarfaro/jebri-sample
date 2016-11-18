import Footer from './Footer.es6.jsx';
import {Grid, Row, Col} from 'react-bootstrap';
import { Router } from 'react-router';

export default class App extends React.Component {
    render() {
        return (
            <main>
                {this.props.children}
                <Footer />
            </main>
        )
    }
}
