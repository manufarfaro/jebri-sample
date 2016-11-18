import { connect} from 'react-redux';
import { bindActionCreators } from 'redux';
import * as commerceActionCreators from '../actions/index.es6.js';
import CommercesFilterGrid from '../components/CommercesFilterGrid.es6.jsx';

const mapStateToProps = (state) => {
    return {
        commerces: state.commerces
    }
}

function mapDispatchToProps(dispatch) {
    return {
        actions: bindActionCreators(Object.assign({}, commerceActionCreators), dispatch)
    };
}

const CommercesFilterGridContainer = connect(
    mapStateToProps,
    mapDispatchToProps
)(CommercesFilterGrid);

export default CommercesFilterGridContainer;
