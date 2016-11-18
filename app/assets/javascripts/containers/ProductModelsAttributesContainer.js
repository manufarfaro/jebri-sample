import { connect} from 'react-redux';
import { bindActionCreators } from 'redux';
import * as productActionCreators from '../actions/index.es6.js';
import ProductModelsAttributes from '../components/ProductModelsAttributes.es6.jsx';

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

const ProductModelsAttributesContainer = connect(
    mapStateToProps,
    mapDispatchToProps
)(ProductModelsAttributes);

export default ProductModelsAttributesContainer;
