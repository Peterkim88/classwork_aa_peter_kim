import React from 'react';
import ReactDOM from 'react-dom';
import Autocomplete from './auto';
import Clock from './clock';
import Tabs from './tabs';
import Weather from './weather';

const panes = [
  {title: 'I', content: 'first'},
  {title: 'II', content: 'second'},
  {title: 'III', content: 'third'}
]

const names = [
  'Anthony',
  'David',
  'Jason',
  'Joy',
  'Laura',
  'Maria',
  'Mike',
  'Peter',
  'Sarah'
]

function Root(){
  return(
    <div>
      <Clock/>
      <Weather/>
      <div className='interactive'>
        <Tabs panes={panes}/>
        <Autocomplete names={names}/>
      </div>
    </div>
  )
}

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Root/>, root);
});
