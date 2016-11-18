import Grid from 'react-bootstrap/lib/Grid';
import Row from 'react-bootstrap/lib/Row';
import Col from 'react-bootstrap/lib/Col';
import Button from 'react-bootstrap/lib/Button';
import Glyphicon from 'react-bootstrap/lib/Glyphicon';
import Scrollchor from 'react-scrollchor';

class Home extends React.Component {
    constructor(props) {
        super(props);
    }
    render () {
      return (
        <section id="index" className="index">
          <Col xs={12} sm={12} md={12} lg={12} className="ribbon-container">
            <Grid fluid={true}>
              <Row>
                <Col xs={12} md={12}>
                  <Img src="/assets/index-logo-ribbon.png" alt="jebri" />
                  <div className="legend-lg">
                    <span className="container">
                      Sample Project <br/>
                      <strong>React</strong> & <strong>Rails</strong> <br/>
                      with <strong>administrator</strong>
                    </span>
                  </div>
                  <div className="scroll-container">
                    <Scrollchor to="#products-catalog" className="nav-link">
                        <Button className="scroll-down" bsSize="large"><Glyphicon glyph="menu-down" /></Button>
                    </Scrollchor>
                  </div>
                </Col>
              </Row>
            </Grid>
          </Col>
        </section>
      );
    }
}

Home.propTypes = {
    setHeaderOptions: React.PropTypes.object,
    getHeaderOptions: React.PropTypes.object,
    handleScroll: React.PropTypes.func
};

export default Home;