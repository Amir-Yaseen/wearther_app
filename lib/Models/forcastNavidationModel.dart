import 'package:flutter/material.dart';
import 'package:wearther_app/Models/weather_model.dart';

class ForcastNavigationModel{
  final bool isToday;
  final TextTheme textstyle;
  final WeatherModel? weatherFeatched;
  ForcastNavigationModel({required this.isToday,required this.textstyle,required this.weatherFeatched,});
}