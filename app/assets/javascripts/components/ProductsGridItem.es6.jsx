import {Grid, Row, Col, Link} from 'react-bootstrap';

class ProductsGridItem extends React.Component {
    constructor(props) {
        super(props);
        this._handleSelectProduct = this._handleSelectProduct.bind(this);
    }

    render () {
        return (
            <Col key={this.props.item.id} xs={6} sm={4} md={3} lg={3} >
                <div className="family-item">
                    <a className="link" onClick={this._handleSelectProduct} href={"#" + this.props.item.name}>
                        <img src={this.props.item.avatar_url} alt={this.props.item.name} />
                        <p className="name">{this.props.item.name}</p>
                    </a>
                </div>
            </Col>
        );
    }
    _handleSelectProduct(event) {
        event.preventDefault();
        this.props.actions.setProduct(this.props.item);
    }
}

ProductsGridItem.propTypes = {
    actions: React.PropTypes.object,
    setProduct: React.PropTypes.object,
    item: React.PropTypes.object,
};

export default ProductsGridItem;