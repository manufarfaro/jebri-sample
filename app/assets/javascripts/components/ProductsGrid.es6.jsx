import {Grid, Row, Col} from 'react-bootstrap';
import ProductsGridItemContainer from '../containers/ProductsGridItemContainer';
import Request from 'superagent';

class ProductsGrid extends React.Component {
    constructor() {
        super();
        this.state = {
            productsCollection: [],
        }
    }
    componentWillMount() {
        this._getProducts();
    }
    componentWillReceiveProps(nextProps) {
        this._getProducts(nextProps.products.family.id);
    }
    render () {
        return (
            <Grid>
                <Row>
                    <Col xs={12} sm={12} md={12} lg={12} className="list" >
                        <Row className="grid">
                            {Object.keys(this.state.productsCollection).length == 0 &&
                                <h3 className="text-center"><Img src="/assets/product-catalog-loading.gif" /></h3>
                            }
                            {Object.keys(this.state.productsCollection).map((key) => {
                                return <ProductsGridItemContainer item={this.state.productsCollection[key]} />
                            })}
                        </Row>
                    </Col>
                </Row>
            </Grid>
        );
    }
    _getProducts(familyId) {

        let url = '/api/product_families/' + (familyId ? familyId : this.props.products.family.id) + '/products'
        Request
            .get(url)
            .set('Accept', 'application/json')
            .end((err, res) => {
                this.setState({productsCollection: res.body});
            });
    }
}

ProductsGrid.propTypes = {
    products: React.PropTypes.object,
};

export default ProductsGrid;