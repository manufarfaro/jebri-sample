import { connect} from 'react-redux';
import { bindActionCreators } from 'redux';
import * as commerceActionCreators from '../actions/index.es6.js';
import CommercesFilter from '../components/CommercesFilter.es6.jsx';

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

const CommercesFilterContainer = connect(
    mapStateToProps,
    mapDispatchToProps
)(CommercesFilter);

export default CommercesFilterContainer;
