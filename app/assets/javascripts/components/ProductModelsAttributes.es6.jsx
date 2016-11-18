import {Grid, Row, Col, Nav, NavItem} from 'react-bootstrap';
import Request from 'superagent';

class ProductModelsAttributes extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            modelsCollection: [],
            modelSelected: {},
            selectedKey: 0
        };
    }
    componentWillMount() {
        this._getProductModels();
    }
    componentWillReceiveProps(nextProps) {
        this._getProductModels(nextProps.products.selected.id);
    }
    render () {
        return (
            <Row>
                <p className="legend-title">Características</p>
                <Col xs={12} sm={12} md={12} lg={12} className="models">
                    <Grid>
                        <Row>
                            <Col xs={12} sm={12} md={12} lg={12} className="models-list" >
                                <Row className="models">
                                    <Col xs={12} sm={12} md={6} lg={6} className="title" >
                                        Modelos: &nbsp;&nbsp;&nbsp;
                                        {Object.keys(this.state.modelsCollection).map((key) => {
                                            return <a href={'#' + this.state.modelsCollection[key].name.replace(/\s+/g, '-').toLowerCase()} className={this.state.selectedKey == key ? 'active' : ''} onClick={(e) => this._handleModelSelect(e, key)}>{this.state.modelsCollection[key].name}</a>
                                        })}
                                    </Col>
                                </Row>
                                <Row className="attributes-list">
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Modelo
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.name}
                                            </Col>
                                        </Row>
                                    </Col>
                                    {this.state.modelSelected.power &&
                                        <Col xs={12} sm={6} md={4} lg={4} >
                                            <Row className="item">
                                                <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                    Potencia
                                                </Col>
                                                <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                    {this.state.modelSelected.power}
                                                </Col>
                                            </Row>
                                        </Col>
                                    }
                                    {this.state.modelSelected.max_useful_power &&
                                        <Col xs={12} sm={6} md={4} lg={4} >
                                            <Row className="item">
                                                <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                    Potencia Máxima
                                                </Col>
                                                <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                    {this.state.modelSelected.max_useful_power}
                                                </Col>
                                            </Row>
                                        </Col>
                                    }
                                    {this.state.modelSelected.security_brake &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Freno de Seguridad
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.security_brake ? 'Si' : 'No'}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.engine_type &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Tipo de Motor
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.engine_type}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.chassis &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Chasis
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.chassis}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.case_width &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Ancho Carcaza
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.case_width}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.cutting_height &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Alto de Corte
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.cutting_height}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.wheels &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Rodado
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.wheels}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.collector_capacity &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Capacidad de Recolector
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.collector_capacity}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.cutting_surface &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Superficie de Corte
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.cutting_surface}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.weight &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Peso
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.weight}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.packaging &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Packaging
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.packaging}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.engine_mounted_on &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Motor mondado sobre
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.engine_mounted_on}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.reel_type &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Tipo de Carretel
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.reel_type}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.use &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Uso
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.use}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.reel_diameter &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Diametro de Tanza
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.reel_diameter}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.tube &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Caño
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.tube}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.cutting_width &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Ancho de Corte
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.cutting_width}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.includes &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Incluye
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.includes}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.color &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Color
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.color}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.fuel_capacity &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Capacidad de Combustibles
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.fueñ_capacity}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.housing_thickness &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Carcasa Espesor
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                {this.state.modelSelected.housing_thickness}
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.documentation_url != '%23' &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Descargar Excel
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                <a href={this.state.modelSelected.documentation_url} target="_blank">
                                                    <i className="fa fa-file-excel-o"></i>
                                                    Descargar
                                                </a>
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                    {this.state.modelSelected.specification_url != '%23' &&
                                    <Col xs={12} sm={6} md={4} lg={4} >
                                        <Row className="item">
                                            <Col xs={6} sm={6} md={6} lg={6} className="title">
                                                Despiece
                                            </Col>
                                            <Col xs={6} sm={6} md={6} lg={6} className="text">
                                                <a href={this.state.modelSelected.specification_url} target="_blank">
                                                    <i className="fa fa-file-text-o"></i>
                                                    Descargar
                                                </a>
                                            </Col>
                                        </Row>
                                    </Col>
                                    }
                                </Row>
                            </Col>
                        </Row>
                    </Grid>
                </Col>
            </Row>
        );
    }
    _handleModelSelect(event, selectedKey) {
        event.preventDefault();
        this.setState({modelSelected: this.state.modelsCollection[selectedKey]});
        this.setState({selectedKey: selectedKey});
    }
    _getProductModels(productId) {
        let url = '/api/products/' + (productId ? productId : this.props.products.selected.id) + '/models';
        Request
            .get(url)
            .set('Accept', 'application/json')
            .end((err, res) => {
                this.setState({modelsCollection: res.body});
                this.setState({modelSelected: this.state.modelsCollection[0]})
            });
    }
}

ProductModelsAttributes.propTypes = {
    actions: React.PropTypes.object,
    products: React.PropTypes.object
};

export default ProductModelsAttributes;