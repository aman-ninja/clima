import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey = 'a9a487e4a5615474a0352cede92d32cb';
class WeatherModel {
  Future<dynamic> getWeatherByCityName(String ciytName) async{
    Network network = Network(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$ciytName&appid=$apiKey&units=metric'));
    var weatherData = await network.getData();
    return weatherData;
  }
  Future<dynamic> getWeatherData() async{
    location locate = new location();
    await locate.getCurrentLocation();
    Network network = Network(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${locate.latitude}&lon=${locate.longitude}&appid=$apiKey&units=metric'));
    var weatherData = await network.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
