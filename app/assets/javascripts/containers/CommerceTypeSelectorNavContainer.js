import { connect} from 'react-redux';
import { bindActionCreators } from 'redux';
import * as commerceActionCreators from '../actions/index.es6.js';
import CommerceTypeSelectorNav from '../components/CommerceTypeSelectorNav.es6.jsx';

const mapStateToProps = (state) => {
    return {
        commerces: state.commerces
    }
};

function mapDispatchToProps(dispatch) {
    return {
        actions: bindActionCreators(Object.assign({}, commerceActionCreators), dispatch)
    };
}

const CommerceTypeSelectorNavContainer = connect(
    mapStateToProps,
    mapDispatchToProps
)(CommerceTypeSelectorNav);

export default CommerceTypeSelectorNavContainer;
