import React from 'react';
import ReactAddonsCssTransitionGroup from 'react-addons-css-transition-group';

class Autocomplete extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      inputVal: ''
    };
    this.handleInput = this.handleInput.bind(this);
    this.selectName = this.selectName.bind(this);
  }

  handleInput(e) {
    this.setState({inputVal: e.currentTarget.value});
  }

  selectName(e) {
    const name = e.currentTarget.innerText;
    this.setState({inputVal: name})
  }

  matches() {
    const matches = [];
    if (this.state.inputVal.length === 0) {
      return this.props.names;
    }

    this.props.names.forEach(name => {
      const sub = name.slice(0, this.state.inputVal.length);
      if (sub.toLowerCase() === this.state.inputVal.toLowerCase()) {
        matches.push(name);
      }
    });

    if (matches.length === 0) {
      matches.push('no matches');
    }

    return matches;
  }

  render(){
    const results = this.matches().map((result, i) => {
      return (
        <li key={i} onClick={this.selectName}>{result}</li>
      )
    })
    return(
      <div>
        <h1>Autocomplete</h1>
        <div className='auto'>
          <input 
            onChange={this.handleInput}
            value={this.state.inputVal}
            placeholder='Search here'/>
          <ul>
            <ReactAddonsCssTransitionGroup
              transitionName='auto'
              transitionEnterTimeout={500}
              transitionLeaveTimeout={500}>
              {results}
            </ReactAddonsCssTransitionGroup>
          </ul>
        </div>
      </div>
    )
  }

}

export default Autocomplete;