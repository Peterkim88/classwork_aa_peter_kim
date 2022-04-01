import React from "react";
import ReactDOM from "react-dom";

import Clock from "./clock";
import Tabs from "./tabs";
import Weather from "./weather";
import AutoComplete from "./autocomplete";

const names = [
  'David',
  'Maria',
  'Peter',
  'Sarah'
];

const panes = [
  {title: 'I', content: 'first pane'},
  {title: 'II', content: 'second pane'},
  {title: 'III', content: 'third pane'}
];

function Root() {
  return(
    <div>
      <Clock />
      <Weather />
      <div className='interactive'>
        <Tabs panes={panes} />
        <AutoComplete names={names} />
      </div>
    </div>
  );
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root/>, document.querySelector('#root'))
})