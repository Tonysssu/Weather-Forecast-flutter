import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '8aae727b4e93dc108f901c86790ff389';
const String apiRequest = 'https://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityname) async {
    NetworkHelper networkHelper = NetworkHelper(
        apiRequest + 'q=$cityname' + '&appid=$apiKey' + '&units=metric');
    var weatherData = await networkHelper.getWeather();

    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Location locator = Location();
    await locator.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(apiRequest +
        '&lat=${locator.latitude}' +
        '&lon=${locator.longitude}' +
        '&appid=$apiKey' +
        '&units=metric');
    var weatherData = await networkHelper.getWeather();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
