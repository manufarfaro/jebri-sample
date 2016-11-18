import {Grid, Row, Col, Link} from 'react-bootstrap';
import ProductModelsAttributesContainer from '../containers/ProductModelsAttributesContainer';
import Request from 'superagent';

class ProductsDetails extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            models: []
        }
    }

    componentWillMount() {
        this._getProductModels();
    }

    render () {
        return (
            <div>
                <Row>
                    <Col xs={12} sm={12} md={12} lg={12} className="product-details">
                        <Grid>
                            <Row>
                                <Grid>
                                    <div className="name">
                                        <h1>
                                            {this.props.products.selected.name}
                                        </h1>
                                    </div>
                                    <Col xs={12} sm={6} md={6} lg={6} className="photo">
                                        <img src={this.props.products.selected.avatar_url} alt={this.props.products.selected.name} style={{width: '100%'}} />
                                    </Col>
                                    <Col xs={12} sm={12} md={3} lg={3} className="description">
                                        <p>
                                            {this.props.products.selected.description}
                                        </p>
                                    </Col>
                                </Grid>
                            </Row>
                        </Grid>
                    </Col>
                </Row>
                <ProductModelsAttributesContainer />
                {(this.props.products.selected.documentation_url != '%23' || this.props.products.selected.specification_url != '%23') &&
                <Row>
                    <Col xs={12} sm={12} md={12} lg={12} className="documents">
                        <Grid>
                            <Row>
                                <Col xs={12} sm={12} md={3} lg={3}>
                                    {this.props.products.selected.documentation_url != '%23' &&
                                        <a href={this.props.products.selected.documentation_url} target="_blank">
                                            Descargar Excel
                                        </a>
                                    }
                                </Col>
                                <Col xs={12} sm={12} md={3} lg={3}>
                                    {this.props.products.selected.specification_url != '%23' &&
                                        <a href={this.props.products.selected.specification_url} target="_blank">
                                            Despiece
                                        </a>
                                    }
                                </Col>
                            </Row>
                        </Grid>
                    </Col>
                </Row>
                }
            </div>
        );
    }
    _handleSelectDocument(documentUrl) {

    }
    _getProductModels() {
        Request
            .get('/api/products/' + this.props.id + '/models')
            .set('Accept', 'application/json')
            .end((err, res) => {
                this.setState({models: res.body});
            });
    }
}

ProductsDetails.propTypes = {
    id: React.PropTypes.number,
    actions: React.PropTypes.object,
    item: React.PropTypes.object,
    products: React.PropTypes.object
};

export default ProductsDetails;