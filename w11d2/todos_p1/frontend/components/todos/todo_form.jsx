import {uniqueId} from '../../utility/id_generator';
import React from 'react';

class TodoForm extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e){
    e.preventDefault();
    const todo = Object.assign({}, this.state, {id: uniqueId()});
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: ""
    });
  }
  
  update(property){
    return e => this.setState({[property]: e.target.value})
  }

  render(){
    return(
      <form className='todo-form' onSubmit={this.handleSubmit}>
        <label>Title:
          <input
            className='input'
            ref='title'
            value={this.state.title}
            placeholder='title'
            onChange={this.update('title')}
            required/>
        </label>
        <label>Body:
          <textarea 
            className='input' 
            ref='body'
            cols='20'
            value={this.state.body}
            rows='5'
            placeholder='description'
            onChange={this.update('body')}
            required>
          </textarea>
        </label>
        <button className='create-button'>Create Todo</button>
      </form>
    );
  }
};

export default TodoForm;