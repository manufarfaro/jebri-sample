import { connect} from 'react-redux';
import { bindActionCreators } from 'redux';
import * as headerActionCreators from '../actions/index.es6.js';
import ProductsGridItem from '../components/ProductsGridItem.es6.jsx';

const mapStateToProps = (state) => {
    return {
        options: state.header.styles,
        products: state.products
    }
};

function mapDispatchToProps(dispatch) {
    return {
        actions: bindActionCreators(Object.assign({}, headerActionCreators), dispatch)
    };
}

const ProductsGridItemContainer = connect(
    mapStateToProps,
    mapDispatchToProps
)(ProductsGridItem);

export default ProductsGridItemContainer;
