import { connect} from 'react-redux';
import { bindActionCreators } from 'redux';
import * as headerActionCreators from '../actions/index.es6.js';
import ProductFamiliesGrid from '../components/ProductFamiliesGrid.es6.jsx';

const mapStateToProps = (state) => {
    console.log(state);
    return {
        products: state.products
    }
};

function mapDispatchToProps(dispatch) {
    return {
        actions: bindActionCreators(Object.assign({}, headerActionCreators), dispatch)
    };
}

const ProductFamiliesGridContainer = connect(
    mapStateToProps,
    mapDispatchToProps
)(ProductFamiliesGrid);

export default ProductFamiliesGridContainer;
