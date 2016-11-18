import { connect } from 'react-redux';
import { setHeaderOptions, getHeaderOptions } from '../actions/index.es6.js';
import HeaderComponent from '../components/Header.es6.jsx';

const mapStateToProps = (state) => {
    return {
        options: state.header.styles
    }
};

const mapDispatchToProps = (dispatch, ownProps) => {
    return {
        onSetHeaderOptions: (options) => {
            dispatch(setHeaderOptions(options));
        },
        onGetHeaderOptions: () => {
            dispatch(getHeaderOptions());
        }
    }
};

const HeaderOptions = connect(
    mapStateToProps,
    mapDispatchToProps
)(HeaderComponent);

export default HeaderOptions;
