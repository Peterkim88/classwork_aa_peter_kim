import React from "react";

export default class Clock extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      time: new Date()
    };
    this.tick = this.tick.bind(this);
  }

  componentDidMount(){
    this.interval = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    clearInterval(this.interval)
  }

  tick(){
    this.setState({time: new Date()});
  }

  render(){
    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();

    hours = (hours < 10) ? `0${hours}` : hours;
    minutes = (minutes < 10) ? `0${minutes}` : minutes;
    seconds = (seconds < 10) ? `0${seconds}` : seconds;

    return (
      <div>
        <h1>Clock</h1>
        <div className='clock'>
          <p>
            <span>
              Time:
            </span>
            <span>
              {hours}:{minutes}:{seconds} EST
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
    );
  }
}