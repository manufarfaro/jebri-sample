import { connect} from 'react-redux';
import { bindActionCreators } from 'redux';
import * as headerActionCreators from '../actions/index.es6.js';
import ProductFamiliesGridItem from '../components/ProductFamiliesGridItem.es6.jsx';

const mapStateToProps = (state) => {
    return {
        products: state.products
    }
};

function mapDispatchToProps(dispatch) {
    return {
        actions: bindActionCreators(Object.assign({}, headerActionCreators), dispatch)
    };
}

const ProductFamiliesGridItemContainer = connect(
    mapStateToProps,
    mapDispatchToProps
)(ProductFamiliesGridItem);

export default ProductFamiliesGridItemContainer;
