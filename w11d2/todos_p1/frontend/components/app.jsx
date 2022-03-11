import React from 'react';
import TodoListContainer from './todos/todo_list_container'
import StepListContainer from './steps/step_list_container';

const App = () => (
  <div className='app'>
    <h1>Todo List</h1>
    <TodoListContainer/>
    <StepListContainer/>
  </div>
);

export default App;