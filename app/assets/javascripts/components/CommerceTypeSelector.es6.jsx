import {Grid, Row, Col} from 'react-bootstrap';

class CommerceTypeSelector extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            commerces_type: ''
        }
    }
    componentWillReceiveProps(nextProps) {
        this.setState({commerces_type: nextProps.commerces.types});
    }
    render () {
        return (
            <Row className="types-selector">
                <Col className="list" xs={12} sm={6} md={6} lg={6}>
                    <p className="title">
                        <a href="#where-to-buy" onClick={(event) => this._handleClickCommerceType(event, 'where-to-buy')}>
                            Where to buy
                        </a>
                    </p>
                </Col>
                <Col className="list" xs={12} sm={6} md={6} lg={6}>
                    <p className="title">
                        <a href="#technical-support" onClick={(event) => this._handleClickCommerceType(event, 'technical-support')}>
                            Technical Support
                        </a>
                    </p>
                </Col>
            </Row>
        );
    }
    _handleClickCommerceType(event, type) {
        event.preventDefault();
        this.props.actions.setCommercesType(type);
    }
}

CommerceTypeSelector.propTypes = {
    actions: React.PropTypes.object,
    commerces: React.PropTypes.object
};

export default CommerceTypeSelector;