import React from "react";
import SidebarNav from './SidebarNav';
import WhiskeyTable from "./WhiskeyTable";

class WhiskeyHome extends React.Component {
    render() {
        return (
            <>
                <SidebarNav/>
                <div id={'main'}>
                    <h1>Whiskey Catalog</h1>
                    <WhiskeyTable />
                </div>
            </>
        )
    }
}

export default WhiskeyHome;
