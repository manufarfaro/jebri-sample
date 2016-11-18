import { Nav, Navbar, NavItem, NavDropdown, MenuItem } from 'react-bootstrap';
import { Link } from 'react-router';
import Scrollchor from 'react-scrollchor';


class HeaderComponent extends React.Component {
  constructor(props) {
      super(props);
      this.state = {
          classNav: 'index',
      };
  }
  componentWillReceiveProps(props) {
      this.setState({ style: this.props.options });
      this.forceUpdate();
  }
  render () {
      return (
          <Navbar fixedTop className={this.props.options.classNav || ''}>
              <Navbar.Header>
                  <Navbar.Brand>
                      <Scrollchor to="#index" className="nav-link">
                        <span className="jebri-logo-mini"></span>
                      </Scrollchor>
                  </Navbar.Brand>
                  <Navbar.Toggle />
              </Navbar.Header>
              <Navbar.Collapse>
                  <Nav>
                      <NavItem eventKey={1}>
                          <Scrollchor to="#products-catalog" className="nav-link">Catalog</Scrollchor>
                      </NavItem>
                      <NavItem eventKey={2}>
                          <Scrollchor to="#commerces-diary" className="nav-link">Where to buy/Technical Support</Scrollchor>
                      </NavItem>
                      <NavItem eventKey={3}>
                          <Scrollchor to="#our-company" className="nav-link">About Us</Scrollchor>
                      </NavItem>
                  </Nav>
                  <Nav pullRight>
                      <div className="social">
                          <a className="facebook" href="https://facebook.com/manufarfaro" target="_blank">
                              <span className="jebri-social-facebook"></span>
                          </a>
                          <a className="youtube" href="https://www.youtube.com/channel/UC2yvnuZ_rLxNM25K0_0CGdw" target="_blank">
                              <span className="jebri-social-youtube"></span>
                          </a>
                      </div>
                  </Nav>
              </Navbar.Collapse>
          </Navbar>
      );
  }
}

HeaderComponent.propTypes = {
    styleClass: React.PropTypes.string,
    options: React.PropTypes.object,
    onSetHeaderOptions: React.PropTypes.func,
    onGetHeaderOptions: React.PropTypes.func
};

export default HeaderComponent;