import * as React from 'react';
import * as ReactDOM from 'react-dom';

interface Props {
  name: string;
}

const Hello: React.FC<Props> = ({ name }) => <div>Hello {name}!</div>;

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Hello name="React" />,
    document.body.appendChild(document.createElement('div'))
  );
});
