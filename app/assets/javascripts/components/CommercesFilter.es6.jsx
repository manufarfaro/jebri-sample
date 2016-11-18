import {Grid, Row, Col, Input, FormControl} from 'react-bootstrap';
import Select from 'react-select';
import Qs from 'qs';
import Request from 'superagent';

class CommercesFilter extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            commerces_type: '',
            dropdownOptions: {
                states: [],
                cities: []
            },
            filters: {
                states: 0,
                cities: 0
            }
        };
        this.setState({comerces_type: this.props.commerces.types});
        this._getStateOptions(this.props.commerces.types);
    }
    componentWillReceiveProps(nextProps) {
        if (nextProps.commerces.types != this.props.commerces.types) {
            this.setState({comerces_type: nextProps.commerces.types});
            this.setState({dropdownOptions: {states: [], cities: []}});
            this.setState({filters: nextProps.commerces.filters});
            this._getStateOptions(nextProps.commerces.types);
        }
        if (nextProps.commerces.filters.states != this.props.commerces.filters.states) {
            this.setState({filters: nextProps.commerces.filters});
            if (Object.keys(nextProps.commerces.filters.states).length > 0) {
                this._getCitiesOptions(nextProps.commerces.filters.states.value, nextProps.commerces.types);
            }
        }
        if (nextProps.commerces.filters.cities !== this.props.commerces.filters.cities) {
            this.setState({filters: nextProps.commerces.filters});
            this._getCitiesOptions(nextProps.commerces.filters.states.value, nextProps.commerces.types);
        }
    }
    render () {
        return (
            <Row className="filter">
                <Col className="states" xs={12} sm={12} md={6} lg={6}>
                    <Select
                        name="states"
                        placeholder="States"
                        value={this.state.filters.states.value}
                        options={this.state.dropdownOptions.states}
                        clearable={false}
                        disabled={Object.keys(this.state.dropdownOptions.states).length === 0}
                        noResultsText="No results found"
                        onChange={(value) => this._handleStateChange(value)}
                    />
                </Col>
                <Col className="cities" xs={12} sm={12} md={6} lg={6}>
                    <Select
                        name="cities"
                        placeholder="Cities"
                        clearable={false}
                        value={this.state.filters.cities.value}
                        options={this.state.dropdownOptions.cities}
                        disabled={Object.keys(this.state.filters.states).length === 0}
                        noResultsText="No results found"
                        onChange={(value) => this._handleCitiesChange(value)}
                    />
                </Col>
            </Row>
        );
    }
    _getStateOptions(commerce_type) {
        let stateOptions = [];
        let queryStringOptions = {};
        if ( commerce_type == 'where-to-buy') {
            queryStringOptions  = {
                is_sales: true
            }
        } else {
            queryStringOptions  = {
                is_technical_support: true
            }
        }
        Request
            .get('/api/states?' + Qs.stringify(queryStringOptions))
            .set('Accept', 'application/json')
            .end((err, res) => {
                {Object.keys(res.body).map((key) => {
                    stateOptions.push({
                        label: res.body[key].name, value: res.body[key].id.toString()
                    });
                });
                }
                this.setState({dropdownOptions: { states: stateOptions }});
                return stateOptions;
            });
    }
    _getCitiesOptions(stateId, commerce_type) {

        let url = '';
        if (stateId) {
            url = '/api/states/' + stateId + '/cities';
        } else {
            url = '/api/states/' + this.state.filters.states.value + '/cities';
        }

        let queryStringOptions = {};
        if (commerce_type == 'where-to-buy') {
            queryStringOptions  = {
                is_sales: true
            }
        } else {
            queryStringOptions  = {
                is_technical_support: true
            }
        }
        let cityOptions = [];
        Request
            .get(url + '?' + Qs.stringify(queryStringOptions))
            .set('Accept', 'application/json')
            .end((err, res) => {
                {Object.keys(res.body).map((key) => {
                    cityOptions.push({
                        label: res.body[key].name, value: res.body[key].id.toString()
                    });
                });
                }
                this.setState({dropdownOptions: { ...this.state.dropdownOptions,cities: cityOptions }});
                return cityOptions;
            });
    }
    _handleStateChange(option) {
        this.props.actions.setStatesFilter(option);
        this.setState({filters: {states: option, cities: {}}})
    }
    _handleCitiesChange(option) {
        this.props.actions.setCitiesFilter(option);
    }
}

CommercesFilter.propTypes = {
    actions: React.PropTypes.object,
    commerces: React.PropTypes.object
};

export default CommercesFilter;