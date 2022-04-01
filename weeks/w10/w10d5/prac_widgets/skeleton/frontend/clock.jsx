import React from 'react';

class Clock extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      time: new Date()
    };
    this.tick = this.tick.bind(this);
  }

  tick(){
    this.setState({time: new Date()});
  }

  componentDidMount(){
    this.interId = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    clearInterval(this.interId);
  }

  render(){
    let hour = this.state.time.getHours();
    let minute = this.state.time.getMinutes();
    let second = this.state.time.getSeconds();

    hour = (hour < 10) ? `0${hour}` : hour;
    minute = (minute < 10) ? `0${minute}` : minute;
    second = (second < 10) ? `0${second}` : second;

    return(
      <div>
        <h1>Clock</h1>
        <div className='clock'>
          <p>
            <span>
              Time:
            </span>
            <span>
              {hour}:{minute}:{second} EST
            </span>
          </p>
          <p>
            <span>
              Date:
            </span>
            <span>
              {this.state.time.toDateString()}
            </span>
          </p>
        </div>
      </div>
    )
  }

}

export default Clock;