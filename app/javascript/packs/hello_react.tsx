import * as React from 'react';
import * as ReactDOM from 'react-dom';
import CommuteCounter from './src/CommuteCounter';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <CommuteCounter />,
    document.body.appendChild(document.createElement('div'))
  );
});
