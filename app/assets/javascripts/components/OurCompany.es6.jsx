import {Grid, Row, Col} from 'react-bootstrap';

class OurCompany extends React.Component {
  constructor() {
    super();
  }
  render () {
    return (
      <section id="our-company" className="our-company">
        <Grid>
          <div>
            <Row>
              <Col xs={12} md={12}>
                <Row>
                  <Col xs={12} sm={12} md={6} lg={6} className="our-company-box">
                    <h3 className="title">
                      <Row>
                        <Col xs={6} sm={6} md={6} lg={6}>
                          About Us
                        </Col>
                        <Col xs={6} sm={6} md={6} lg={6} className="brand">
                          <span className="jebri-logo-mini"></span>
                        </Col>
                      </Row>
                    </h3>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent quam augue, viverra eu nulla sit amet, fringilla pretium lacus. Etiam porta dolor eget tortor euismod, et tempor tortor ullamcorper. Sed faucibus gravida sagittis. Phasellus molestie, tortor ut fringilla convallis, odio magna porta nisl, quis pellentesque felis sem non metus. Praesent nibh ipsum, lacinia eget ipsum consequat, viverra ultrices massa. Phasellus vitae magna pellentesque, vulputate eros et, molestie magna. Donec pellentesque accumsan ligula vitae faucibus. Maecenas laoreet sit amet elit non molestie. Integer feugiat vitae ante at placerat.</p>
                      <p>Nulla dignissim elit justo, quis aliquam nibh pretium ac. Nunc blandit felis vel lectus hendrerit, id venenatis massa placerat. Curabitur ac nunc ut enim feugiat sagittis ut quis orci. Phasellus ornare scelerisque dui, quis consectetur diam tempor vel. Aliquam erat volutpat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam eu tincidunt libero. Fusce tincidunt lectus magna, at vulputate sem mollis a. Quisque ac tortor tortor. Sed quis risus neque. Curabitur blandit faucibus faucibus. Pellentesque vitae finibus tellus. Praesent finibus metus diam, eu congue leo scelerisque sed.</p>
                  </Col>
                </Row>
              </Col>
            </Row>
          </div>
        </Grid>
      </section>
    );
  }
}

OurCompany.propTypes = {
};

export default OurCompany;