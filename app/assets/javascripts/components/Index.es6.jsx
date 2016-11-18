import {Grid, Row, Col} from 'react-bootstrap';
import Scroll from 'react-scroll';
import HeaderOptions from '../containers/HeaderOptions';
import HomeContainer from '../containers/HomeContainer';
import OurCompany from './OurCompany.es6.jsx';
import ProductsCatalogContainer from '../containers/ProductsCatalogContainer';
import CommercesDiaryContainer from '../containers/CommercesDiaryContainer';

class Index extends React.Component {
  constructor(props) {
      super(props);
      this._handleScrollToBottom = this._handleScrollToBottom.bind(this);
  }

  componentDidMount() {
      Scroll.scrollSpy.update();
  }
  componentWillUnmount() {
    Scroll.Events.scrollEvent.remove('begin');
    Scroll.Events.scrollEvent.remove('end');
  }
  render () {
    return (
      <Grid fluid={true} className="main">
        <HeaderOptions />
        <Row>
            <HomeContainer handleScroll={this._handleScrollToBottom} />
            <ProductsCatalogContainer />
            <CommercesDiaryContainer />
            <OurCompany />
        </Row>
      </Grid>
    );
  }

  _handleScrollToBottom(elementName) {
      Scroll.scroller.scrollTo(elementName, {
          duration: 1500,
          delay: 100,
          smooth: true
      })
  }
}

Index.propTypes = {
    fontColor: React.PropTypes.string,
    options: React.PropTypes.object,
    filter: React.PropTypes.object,
    setHeaderOptions: React.PropTypes.func,
    getHeaderOptions: React.PropTypes.func
};

export default Index;