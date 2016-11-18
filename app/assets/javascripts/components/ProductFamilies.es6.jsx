import {Grid, Row, Col} from 'react-bootstrap';
import ProductFamiliesGrid from './ProductFamiliesGrid.es6.jsx';

class ProductFamilies extends React.Component {
    constructor() {
        super();
    }
    render () {
        return (
            <section id="product-families" className="product-families">
                <Grid>
                    <div>
                        <Row>
                            <Col xs={12} md={12}>
                                <div className="list pull-right">
                                    <ProductFamiliesGrid/>
                                </div>
                            </Col>
                        </Row>
                    </div>
                </Grid>
            </section>
        );
    }
}

ProductFamilies.propTypes = {

};

export default ProductFamilies;