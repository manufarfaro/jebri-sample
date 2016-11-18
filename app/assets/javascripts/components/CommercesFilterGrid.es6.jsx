import {Grid, Row, Col, Glyphicon} from 'react-bootstrap';
import Qs from 'qs';
import Request from 'superagent';

class CommercesFilterGrid extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            officesCollection: {},
            filters: {
                states: {},
                cities: {}
            }
        };
        this._getOfficesCollection(this.props.commerces.filters.cities.value);
    }
    componentWillReceiveProps(nextProps) {
        this.setState({filters: nextProps.commerces.filters});
        this._getOfficesCollection(nextProps.commerces.filters.cities.value);
    }
    render () {
        return (
            <Row className="grid">
                {Object.keys(this.state.officesCollection).length == 0 &&
                    <h3 className="text-center"><Img src="/assets/commerces-loading.gif" /></h3>
                }
                {Object.keys(this.state.officesCollection).map((key) => {
                    return (
                        <Col key={key} className="item" xs={12} sm={12} md={4} lg={4}>
                            <h3>
                                {this.state.officesCollection[key].commerce.name} &nbsp;
                                <small>
                                    {this.state.officesCollection[key].fantasy_name} &nbsp;
                                    {this.state.officesCollection[key].commerce.url &&
                                        <a href={this.state.officesCollection[key].commerce.url} target="_blank">
                                            <Glyphicon glyph="glyphicon glyphicon-globe" />
                                        </a>
                                    }
                                </small>
                            </h3>
                            <p>
                                <Glyphicon glyph="glyphicon glyphicon-map-marker" /> {this.state.officesCollection[key].street + ' ' + this.state.officesCollection[key].number + ' ' + this.state.officesCollection[key].floor + ' ' + this.state.officesCollection[key].appartment}
                            </p>
                            {Object.keys(this.state.officesCollection[key].phones).map((phone_key) => {
                                return (<p key={phone_key}>
                                    <a href={"tel:" + this.state.officesCollection[key].phones[phone_key].number} target="_blank">
                                        <Glyphicon glyph="glyphicon glyphicon-phone" /> &nbsp;
                                        {this.state.officesCollection[key].phones[phone_key].number}
                                    </a> &nbsp;
                                    <span>{this.state.officesCollection[key].phones[phone_key].phone_type + ' ' + this.state.officesCollection[key].phones[phone_key].notes}</span>
                                </p>)
                            })}
                        </Col>
                    )
                })}
            </Row>
        );
    }
   _getOfficesCollection(city_id) {
       let requestOptions = {
           city_id: city_id
       };
       if (this.props.commerces.types === 'where-to-buy') {
           requestOptions = {...requestOptions, is_sales: true};
       } else {
           requestOptions = {...requestOptions, is_technical_support: true};
       }
       Request
           .get('/api/offices?' + Qs.stringify(requestOptions))
           .set('Accept', 'application/json')
           .end((err, res) => {
               this.setState({officesCollection: res.body});
           });
   }
}

CommercesFilterGrid.propTypes = {
    actions: React.PropTypes.object,
    commerces: React.PropTypes.object
};

export default CommercesFilterGrid;