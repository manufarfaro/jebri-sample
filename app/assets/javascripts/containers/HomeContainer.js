import { connect} from 'react-redux';
import { bindActionCreators } from 'redux';
import * as headerActionCreators from '../actions/index.es6.js';
import Home from '../components/Home.es6.jsx';

const mapStateToProps = (state) => {
    return {
        options: state.header.styles
    }
};

function mapDispatchToProps(dispatch) {
    return {
        actions: bindActionCreators(Object.assign({}, headerActionCreators), dispatch)
    };
}

const HomeContainer = connect(
    mapStateToProps,
    mapDispatchToProps
)(Home);

export default HomeContainer;
