import {Grid, Row, Col} from 'react-bootstrap';

class CommerceTypeSelectorNav extends React.Component {
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
            <Row className="types-selector-nav">
                <Col className="list" xs={12} sm={12} md={12} lg={12}>
                    <p className="title">
                        <a href="#where-to-buy" className={this.props.commerces.types == 'where-to-buy' ? 'active' : ''} onClick={(event) => this._handleClickCommerceType(event, 'where-to-buy')}>
                            Where to buy
                        </a> &nbsp;
                        <a href="#technical-support" className={this.props.commerces.types == 'technical-support' ? 'active' : ''} onClick={(event) => this._handleClickCommerceType(event, 'technical-support')}>
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

CommerceTypeSelectorNav.propTypes = {
    actions: React.PropTypes.object,
    commerces: React.PropTypes.object
};

export default CommerceTypeSelectorNav;