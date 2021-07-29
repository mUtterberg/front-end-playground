import React from "react";
import PropTypes from "prop-types";
import ReactDOM from "react-dom";

import { Nav, NavLink } from "reactstrap";

class SidebarNav extends React.Component {

    state = {
        expanded: true
    };
    static propTypes = {
        componentType: PropTypes.any,
        componentClass: PropTypes.oneOfType([
            PropTypes.string,
            PropTypes.func
        ]),
        disabled: PropTypes.bool,
        expanded: PropTypes.bool,
        onToggle: PropTypes.func,
        onSelect: PropTypes.func
    };

    static defaultProps = {
        componentClass: 'nav',
        expanded: true
    };

    collapseSideNav = () => {
        this.setState({
            expanded: false
        })

        let sidebar = document.getElementById('sidebarNav')
        ReactDOM.findDOMNode(sidebar).style.width = '25px';

        let element = document.getElementById('main')
        ReactDOM.findDOMNode(element).style.marginLeft = '25px';
    };

    expandSideNav = () => {
        this.setState({
            expanded: true
        })

        let sidebar = document.getElementById('sidebarNav')
        ReactDOM.findDOMNode(sidebar).style.width = '15%';

        let element = document.getElementById('main')
        ReactDOM.findDOMNode(element).style.marginLeft = '16%';
    };

    toggleSideNav = () => {
        if (this.state.expanded === true) {
            this.collapseSideNav();
        } else {
            this.expandSideNav();
        }
    }

    render() {
        const {
            componentType,
            componentClass,
            disabled,
            expanded,
            onToggle,
            onSelect,
            ...props
        } = this.props;

        return (
            <div id={'sidebarNav'} className={'sidebar'} onClick={this.toggleSideNav}>
                <Nav vertical>
                    <button className="closebtn">&times;</button>
                    <NavLink href={'/'}>Home</NavLink>
                    <NavLink href={'/ideas'}>Ideas</NavLink>
                    <NavLink href={'/whiskeys'}>Whiskeys</NavLink>
                </Nav>
            </div>
        )
    }
}

export default SidebarNav;
