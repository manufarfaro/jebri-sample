import { connect} from 'react-redux';
import { bindActionCreators } from 'redux';
import * as commerceActionCreators from '../actions/index.es6.js';
import CommercesDiary from '../components/CommercesDiary.es6.jsx';

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

const CommercesDiaryContainer = connect(
    mapStateToProps,
    mapDispatchToProps
)(CommercesDiary);

export default CommercesDiaryContainer;
