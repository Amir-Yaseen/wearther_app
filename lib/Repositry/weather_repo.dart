

import 'package:wearther_app/Models/current_condition.dart';
import 'package:wearther_app/Models/weather_model.dart';
import 'package:wearther_app/Repositry/services/weather_service.dart';

class Repository{
 final WeatherService weatherService;
 Repository({required this.weatherService});


// Future<Location?> getLocation(String city) async => weatherService.getLocation(city);
// Future<CurrentWeather?> getCurrentWeather(String city) async => weatherService.getCurrentWeather(city);
// Future<List<Forecastday>?> getForcast(String city) async => weatherService.getForcast(city);
Future<List<CurrentCondition>?> weatherConditions() async => weatherService.weatherConditions();
Future<WeatherModel?> getWeatherModel(city) async=> weatherService.getWeatherModel(city);
}