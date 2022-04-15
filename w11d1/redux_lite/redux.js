class Store {
  constructor(rootReducer){
    this.rootReducer = rootReducer;
    this.state = {};
    this.getState = this.getState.bind(this);
  }

  dispatch(action){
    this.state = this.rootReducer(this.state, action);
  }

  getState(){
    return Object.assign({}, this.state);
  }
}

const createStore = (...args) => new Store(...args);

const combineReducers = reducers => {
  return (prevState, action) => {
    const nextState = {};
    Object.keys(reducers).forEach((k) => {
      nextState[k] = reducers[k](prevState, action);
    });
    return nextState;
  }
}

