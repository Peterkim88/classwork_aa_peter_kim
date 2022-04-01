import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = {num1: "", num2: "", result:0}
    this.updateNum1 = this.updateNum1.bind(this);
    this.updateNum2 = this.updateNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
  }

  updateNum1(e) {
    this.setState({num1: +e.currentTarget.value});
  }

  updateNum2(e) {
    this.setState({num2: +e.currentTarget.value});
  }

  add() {
    // const sum = parseInt(this.state.num1) + parseInt(this.state.num2);
    const sum = this.state.num1 + this.state.num2;
    this.setState({result: sum});
    return sum;
  }

  subtract() {
    const sum = this.state.num1 - this.state.num2;
    this.setState({result: sum});
    return sum;
  }

  multiply() {
    const sum = this.state.num1 * this.state.num2;
    this.setState({result: sum});
    return sum;
  }

  divide() {
    const sum = this.state.num1 / this.state.num2;
    this.setState({result: sum});
    return sum;
  }

  render(){
    return (
      <div>
        <h1>{this.state.result}</h1>
          <input type="text" onChange={this.updateNum1} value={this.state.num1}/>
          <input type="text" onChange={this.updateNum2} value={this.state.num2}/>
          <button>Clear</button>
          <br />
          <button onClick={this.add}>+</button>
          <button onClick={this.subtract}>-</button>
          <button onClick={this.multiply}>*</button>
          <button onClick={this.divide}>/</button>
      </div>
    );
  }
}

export default Calculator;
