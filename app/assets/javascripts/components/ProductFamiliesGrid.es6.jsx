import {Grid, Row, Col} from 'react-bootstrap';
import ProductFamiliesGridItemContainer from '../containers/ProductFamiliesGridItemContainer';
import Request from 'superagent';

class ProductFamiliesGrid extends React.Component {
    constructor() {
        super();
        this.state = {
            families: [],
        }
    }
    componentWillMount() {
        this._getProductFamilies();
    }
    render () {
        return (
            <Grid>
                <Row>
                    <Col xs={12} sm={12} md={6} lg={6} className="list pull-right" >
                        <p className="title">
                            This is a sample <strong className="brand">Family Catalog</strong>
                        </p>
                        <Row key="family-grid-items" className="grid">
                            {Object.keys(this.state.families).map((key) => {
                                return (
                                    <Col key={this.state.families[key].id} xs={4} sm={4} md={3} lg={3} >
                                        <ProductFamiliesGridItemContainer key={key} item={this.state.families[key]} />
                                    </Col>
                                )
                            })}
                        </Row>
                    </Col>
                </Row>
            </Grid>
        );
    }
    _getProductFamilies() {
        Request
            .get('/api/product_families/index')
            .set('Accept', 'application/json')
            .end((err, res) => {
                this.setState({families: res.body});
            });
    }
}

ProductFamiliesGrid.propTypes = {
};

export default ProductFamiliesGrid;