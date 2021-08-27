// app/javascript/packs/distilleries.jsx
console.log('🥃');

import React from "react";
import { render } from "react-dom";
import Provider from '../components/Provider';
import Cellar from '../components/Cellar';

render(<Provider>
    <Cellar/>
</Provider>, document.querySelector('#root'));
