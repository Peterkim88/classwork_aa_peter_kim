class Store {
  constructor(rootReducer){
    this.rootReducer = rootReducer;
    this.state = {};
    this.getState = this.getState.bind(this);
  }

  getState(){
    return Object.assign({}, this.state);
  }
}

const createStore = (...args) => new Store(...args);

const combineReducers = props => {
  return (prevState, action) => {
    const nextState = {};
    Object.keys(props).forEach((k) => {
      nextState[k] = props[k](prevState, action);
    });
    return nextState;
  }
}

