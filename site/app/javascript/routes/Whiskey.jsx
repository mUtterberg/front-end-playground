import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import WhiskeyHome from '../components/WhiskeyHome';

export default (
    <Router>
        <Switch>
            <Route path='/whiskeys' exact component={WhiskeyHome}/>
        </Switch>
    </Router>
)
