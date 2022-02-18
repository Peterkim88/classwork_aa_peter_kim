class Clock {
  constructor() {
    // 1. Create a Date object.
    let date = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hour = date.getHours();
    this.minute = date.getMinutes();
    this.second = date.getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    // let time = this
    setInterval(() => this._tick(), 1000);
    // setInterval(() => this._tick(), 1000);
    let that = this;
    // console.log(that)
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    let time = `The time is ${this.hour}:${this.minute}:${this.second}`;
    // Use console.log to print it.
    console.log(time);
  }

  _tick() {
    // console.log(this)
    // 1. Increment the time by one second.
    // console.log('yo')
    this.second++;
    if (this.second == 60) {
      this.second = 0;
      this.minute++;
      if (this.minute == 60) {
        this.minute = 0;
        this.hour++;
        if (this.hour == 24) {
          this.hour = 0;
        }
      }
    }
    // 2. Call printTime.
    this.printTime();
    
  }

}

const clock = new Clock();

// _tick(this) {
//   // 1. Increment the time by one second.
//   console.log('yo');
//   this.second++;
//   if (this.second == 60) {
//     this.second = 0;
//     this.minute++;
//     if (this.minute == 60) {
//       this.minute = 0;
//       this.hour++;
//       if (this.hour == 24) {
//         this.hour = 0;
//       }
//     }
//   }
//   // 2. Call printTime.
//   printTime();
// }