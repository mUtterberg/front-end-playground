import React from 'react'
import { render } from 'react-dom'
import WhiskeyApp from '../components/WhiskeyApp'

document.addEventListener('DOMContentLoaded', () => {
  render(
      <WhiskeyApp/>, // Element
      document.body.appendChild(document.createElement('div')), // Container
      function() { console.log('Loaded whiskey app'); } // Optional: callback
  );
});
