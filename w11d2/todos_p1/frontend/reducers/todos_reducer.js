import {RECEIVE_TODO, RECEIVE_TODOS} from '../actions/todo_actions';

const todosReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = {};

  switch(action.type){
    case RECEIVE_TODO:
      const newTodo = {[action.todo.id]: action.todo};
      return Object.assign({}, state, newTodo);
    case RECEIVE_TODOS:
      action.todos.forEach(todo => {
        nextState[todo.id] = todo;
      });
      return nextState;
    default:
      return state;
  };
};