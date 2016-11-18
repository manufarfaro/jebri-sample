import { connect} from 'react-redux';
import { bindActionCreators } from 'redux';
import * as headerActionCreators from '../actions/index.es6.js';
import Index from '../components/Index.es6.jsx';

const mapStateToProps = (state, ownProps) => {
    return {
        options: state.header.styles,
        filter: ownProps.location.query.filter
    }
};

function mapDispatchToProps(dispatch) {
    return {
        actions: bindActionCreators(Object.assign({}, headerActionCreators), dispatch)
    };
}

const IndexContainer = connect(
    mapStateToProps,
    mapDispatchToProps
)(Index);

export default IndexContainer;
