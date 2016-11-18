import {Grid, Row, Col} from 'react-bootstrap';
import CommerceTypeSelectorContainer from '../containers/CommerceTypeSelectorContainer';
import CommerceTypeSelectorNavContainer from '../containers/CommerceTypeSelectorNavContainer';
import CommercesFilterContainer from '../containers/CommercesFilterContainer';
import CommercesFilterGridContainer from '../containers/CommercesFilterGridContainer';

class CommercesDiary extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            commerces_type: ''
        }
    }
    componentWillReceiveProps(nextProps) {
        this.setState({commerces_type: nextProps.commerces.type});
    }
    render () {
        return (
            <section id="commerces-diary" className="commerces-diary">
                <Grid>
                    <div>
                        <Row>
                            <Col xs={12} md={12}>
                                { Object.keys(this.props.commerces.types).length === 0 && <CommerceTypeSelectorContainer />}
                                { Object.keys(this.props.commerces.types).length > 0 &&
                                    <div>
                                        <CommerceTypeSelectorNavContainer />
                                        <CommercesFilterContainer />
                                    </div>
                                }
                                { Object.keys(this.props.commerces.filters.cities).length > 0  &&
                                    <CommercesFilterGridContainer />
                                }
                            </Col>
                        </Row>
                    </div>
                </Grid>
            </section>
        );
    }
}

CommercesDiary.propTypes = {
    actions: React.PropTypes.object,
    commerces: React.PropTypes.object
};

export default CommercesDiary;