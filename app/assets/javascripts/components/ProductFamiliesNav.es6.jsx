import {Grid, Row, Col} from 'react-bootstrap';
import ProductFamiliesGridItemContainer from '../containers/ProductFamiliesGridItemContainer';
import OwlCarousel from 'react-owl-carousel/lib/OwlCarousel';
import Request from 'superagent';

class ProductFamiliesNav extends React.Component {
    constructor() {
        super();
        this.state = {
            families: []
        }
    }
    componentWillMount() {
        this._getProductFamilies();
    }
    render () {
        let title = this.props.products.family.name;
        let titleLastIndex = title.lastIndexOf(" ");
        var settings = {
            dots: false,
            infinite: true,
            speed: 500,
            slidesToShow: 4,
            slidesToScroll: 1
        };
        return (
            <Grid>
                <Row>
                    <Col xs={12} sm={12} md={12} lg={12} className="list nav-list" >
                        <Row>
                            <Col xs={12} sm={12} md={3} lg={3} >
                                <p className="title">
                                    {title.substring(0, titleLastIndex)} <strong className="brand">{title.split(' ').pop()}</strong>
                                </p>
                            </Col>
                            <Col xs={12} sm={12} md={9} lg={9} >
                                <OwlCarousel slideSpeed={300} navigation>
                                    {Object.keys(this.state.families).map((key) => {
                                        return (
                                            <div key={this.state.families[key].id} className="col-xs-12 col-sm-12 col-md-12 col-lg-!2">
                                                <ProductFamiliesGridItemContainer  item={this.state.families[key]} />
                                            </div>
                                        )
                                    })}
                                </OwlCarousel>
                            </Col>
                        </Row>
                    </Col>
                </Row>
            </Grid>
        );
    }
    _getProductFamilies() {
        Request
            .get('/api/product_families')
            .set('Accept', 'application/json')
            .end((err, res) => {
                this.setState({families: res.body});
            });
    }
}

ProductFamiliesNav.propTypes = {
    products: React.PropTypes.object,
};

export default ProductFamiliesNav;