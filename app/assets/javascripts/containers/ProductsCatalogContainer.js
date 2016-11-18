import { connect} from 'react-redux';
import { bindActionCreators } from 'redux';
import * as productActionCreators from '../actions/index.es6.js';
import ProductsCatalog from '../components/ProductsCatalog.es6.jsx';

const mapStateToProps = (state) => {
    return {
        products: state.products
    }
};

function mapDispatchToProps(dispatch) {
    return {
        actions: bindActionCreators(Object.assign({}, productActionCreators), dispatch)
    };
}

const ProductsCatalogContainer = connect(
    mapStateToProps,
    mapDispatchToProps
)(ProductsCatalog);

export default ProductsCatalogContainer;
