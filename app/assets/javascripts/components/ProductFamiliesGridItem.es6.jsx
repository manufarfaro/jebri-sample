import {Grid, Row, Col, Link} from 'react-bootstrap';

class ProductFamiliesGridItem extends React.Component {
    constructor(props) {
        super(props);
        this._handleSelectFamily = this._handleSelectFamily.bind(this);
    }

    componentWillMount() {
    }

    render () {
        return (
            <div className="family-item">
                <a className="link" onClick={this._handleSelectFamily} href={"#seleccionarFamilia"}>
                    <img src={this.props.item.avatar_url} alt={this.props.item.name} />
                    <p className="name">{this.props.item.name}</p>
                </a>
            </div>
        );
    }
    _handleSelectFamily(event) {
        event.preventDefault();
        this.props.actions.setProductFamily(this.props.item);
        if (this.props.products.selected) {
            this.props.actions.setProduct({});
        }
        this.forceUpdate();
    }
}

ProductFamiliesGridItem.propTypes = {
    actions: React.PropTypes.object,
    setProductFamily: React.PropTypes.object,
    setProduct: React.PropTypes.object,
    products: React.PropTypes.object,
    item: React.PropTypes.object,
};

export default ProductFamiliesGridItem;