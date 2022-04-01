import React from 'react';

const addWeatherQueryKey = (obj) => {
  const parts = [];
  for (let i in obj) {
    if (obj.hasOwnProperty(i)) {
      parts.push(`${encodeURIComponent(i)}=${encodeURIComponent(obj[i])}`);
    }
  }
  return parts.join('&');
}  

class Weather extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      weather: null
    };
    this.pollWeather = this.pollWeather.bind(this);
  }

  componentDidMount(){
    navigator.geolocation.getCurrentPosition(this.pollWeather);
  }


  pollWeather(location){
    let url = 'http://api.openweathermap.org/data/2.5/weather?';
    
    const params = {
      lat: location.coords.latitude,
      lon: location.coords.longitude
    };
    
    const apiKey = '55cf88f7e7a6085ab6cce085b78008fd'
    url += `${addWeatherQueryKey(params)}&APPID=${apiKey}`;
    
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = () => {
      if (xmlhttp.status === 200 && xmlhttp.readyState === XMLHttpRequest.DONE){
        const data = JSON.parse(xmlhttp.responseText)
        this.setState({weather: data})
      }
    }

    xmlhttp.open('GET', url, true);
    xmlhttp.send();

  }

  render(){
    let weatherContent = <div></div>;

    if (this.state.weather){
      const currentWeather = this.state.weather;
      const temp = (currentWeather.main.temp - 273.15) * 1.8 + 32;
      weatherContent =  <div>
                          <p>{currentWeather.name}</p>
                          <p>{temp.toFixed(1)} degrees</p>
                        </div>;
    } else {
      weatherContent = <div className='loading'>seaching location</div>
    }
    return(
      <div>
        <h1>Weather</h1>
        <div className='weather'>
          {weatherContent}
        </div>
      </div>
    )
  }

}

export default Weather;