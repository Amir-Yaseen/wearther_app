import 'dart:convert';

import 'package:http/http.dart';
import 'package:wearther_app/Models/current_condition.dart';
import 'package:wearther_app/Models/weather_model.dart';

class WeatherService{
  final String  url = 'https://weatherapi-com.p.rapidapi.com/forecast.json?';
 final String conditionsUrl = 'https://www.weatherapi.com/docs/weather_conditions.json';
 final  headers = {
    'X-RapidAPI-Key':'f2f1531517msh1ea448f3d9372a9p1d1687jsnad62d773a10a',
    'X-RapidAPI-Host':'weatherapi-com.p.rapidapi.com'
  };

  // functions
//Function to get weatherModel
Future<WeatherModel?> getWeatherModel(String city) async{
   try{
     final response =await get(Uri.parse('${url}q=$city&days=5'),headers: headers);
      final decoded = jsonDecode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(decoded);
      // print(weatherModel.currentWeather!.feelslikeC);
      return weatherModel;
   }
   catch(e){
    return null;
   }
  }

  // Function to get Location
  // Future<Location?> getLocation(String city) async{
  //  try{
  //    final response =await get(Uri.parse('${url}q=$city&days=5'),headers: headers);
  //     final decoded = jsonDecode(response.body);
  //     Location location = Location.fromJson(decoded['location']);
  //     // print('in getlocation${location.country}');
  //     return location;
  //  }
  //  catch(e){
  //   return null;
  //  }
  // }

  // function to get current wearther

  // Future<CurrentWeather?> getCurrentWeather(String city) async{
  //  try{
  //    final response =await get(Uri.parse('${url}q=$city&days=5'),headers: headers);
  //     final decoded = jsonDecode(response.body);
  //     CurrentWeather currentWeather = CurrentWeather.fromJson(decoded['current']);
  //     print(currentWeather.tempC);
  //     return currentWeather;
  //  }
  //  catch(e){
  //   return null;
  //  }
  // }
// function to get forcast weather
  // Future<List<Forecastday>?> getForcast(String city) async{
  //   List<Forecastday> forcastDaysList = [];
  //  try{
  //    final response =await get(Uri.parse('${url}q=$city&days=3'),headers: headers);
  //     final decoded = jsonDecode(response.body);
  //     final  forcasts = decoded['forecast']['forecastday'];
  //     // print(forcasts[1]);
  //     for(int i=0;i<forcasts.length;i++){
  //      final forcastedDay = Forecastday.fromJson(forcasts[i]);
  //      forcastDaysList.add(forcastedDay);
  //     //  print(forcastDaysList[i].date);
  //     }
  //     return forcastDaysList;
  //  }
  //  catch(e){
  //   return null;
  //  }
  // }
  // function to get current condition icon and text to show on header
  Future<List<CurrentCondition>?> weatherConditions() async{
    List<CurrentCondition> currentConditionList = [];
   try{
     final response =await get(Uri.parse(conditionsUrl));
      final decoded = jsonDecode(response.body);
      for(int i=0; i<decoded.length;i++){
       currentConditionList.add(CurrentCondition.fromJson(decoded[i]));
      }
      return currentConditionList;
   }
   catch(e){
    return null;
   }
  }

}