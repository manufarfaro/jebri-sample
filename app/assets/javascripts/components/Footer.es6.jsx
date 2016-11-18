import Grid from 'react-bootstrap/lib/Grid';
import Row from 'react-bootstrap/lib/Row';
import Col from 'react-bootstrap/lib/Col';
import Nav from 'react-bootstrap/lib/Nav';
import NavItem from 'react-bootstrap/lib/NavItem';
import Scrollchor from 'react-scrollchor';

export default class Footer extends React.Component {
  render () {
    return (
        <footer>
            <Grid>
                <Row>
                    <Col xs={12} sm={4} md={4} lg={4} >
                        <span className="brand jebri-logo" />
                        <p>
                            The Chantas 392 <br />
                            City (0000)<br />
                            Buenos Aires. Argentina
                        </p>
                    </Col>
                    <Col xs={12} sm={4} md={4} lg={4} className="phones">
                        <p>
                            <span className="title">Phones</span><br />
                            (0054-0237) 0000000<br />
                            0000000 / 0000000
                        </p>
                        <p>
                            <span className="starred title">Post-Selling</span><br />
                            0800-555-5555
                        </p>
                        <p>
                            <a className="email" href="mailto:manufarfaro@gmail.com">manufarfaro@gmail.com</a>
                        </p>
                    </Col>
                    <Col xs={12} sm={4} md={4} lg={4} className="social">
                        <p>
                            <a className="facebook" href="https://facebook.com/manufarfaro" target="_blank">
                                <span className="jebri-social-facebook"></span>
                            </a>
                            <a className="youtube" href="https://www.youtube.com/channel/UC2yvnuZ_rLxNM25K0_0CGdw" target="_blank">
                                <span className="jebri-social-youtube"></span>
                            </a>
                        </p>
                    </Col>
                </Row>
            </Grid>
        </footer>
    );
  }
}

