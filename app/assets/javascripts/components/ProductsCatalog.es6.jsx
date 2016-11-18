import ReactCSSTransitionGroup from 'react-addons-css-transition-group';
import {Grid, Row, Col} from 'react-bootstrap';
import ProductFamiliesNavContainer from '../containers/ProductFamiliesNavContainer';
import ProductFamiliesGrid from './ProductFamiliesGrid.es6.jsx';
import ProductsGridContainer from '../containers/ProductsGridContainer';
import ProductDetailsContainer from '../containers/ProductDetailsContainer';

class ProductsCatalog extends React.Component {
    constructor(props) {
        super(props);
    }

    render () {
        let catalogStyle = {
            transition: 'background-image 500ms linear',
            background: 'none'
        };
        let family_id = this.props.products.family.id;
        return (
            <section id="products-catalog" className="products-catalog" style={this.props.products.family.id ? catalogStyle : null}>
                <Grid fluid>
                    <Row>
                        <Col xs={12} md={12}>
                            <ReactCSSTransitionGroup
                                transitionName="catalog-grid"
                                transitionEnterTimeout={400}
                                transitionLeaveTimeout={100}>
                                { family_id ? <ProductFamiliesNavContainer /> : <ProductFamiliesGrid /> }
                            </ReactCSSTransitionGroup>
                            <ReactCSSTransitionGroup
                                transitionName="catalog-grid"
                                transitionEnterTimeout={600}
                                transitionLeaveTimeout={100}>
                                { family_id && Object.getOwnPropertyNames(this.props.products.selected).length < 1 && <ProductsGridContainer />}
                            </ReactCSSTransitionGroup>
                            {family_id && Object.getOwnPropertyNames(this.props.products.selected).length > 1 && <ProductDetailsContainer id={this.props.products.selected.id} />}
                        </Col>
                    </Row>
                </Grid>
            </section>
        );
    }
}

ProductsCatalog.propTypes = {
    products: React.PropTypes.object
};

export default ProductsCatalog;