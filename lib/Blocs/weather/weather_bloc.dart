import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wearther_app/Models/current_condition.dart';
import 'package:wearther_app/Models/weather_model.dart';
import 'package:wearther_app/Repositry/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({ this.repository}) : super(LoadingState()) {
    on<WeatherInitialFeatchEvent>(weatherInitialFeatchEvent);
    // on<ButtonTapEvent>(buttonTapEvent);
  }
  final Repository? repository;
  late final WeatherModel? weatherModel;
  CurrentCondition? condition;
  List<CurrentCondition>? conditionList;
  FutureOr<void> weatherInitialFeatchEvent(WeatherInitialFeatchEvent event, Emitter<WeatherState> emit)async {
   
    emit(LoadingState());
    // Location? location= await repository.getLocation('islamabad');
    // print(location!);
    // CurrentWeather? currentWeather  =await repository.getCurrentWeather('islamabad');
    conditionList =  await repository!.weatherConditions();
    // List<Forecastday>? forcastDayList = await repository.getForcast('islamabad');
    weatherModel = await repository!.getWeatherModel('islamabad');
    // print(weatherModel!.);
    condition = conditionList!.firstWhere((element) => element.code == weatherModel!.currentWeather!.condition!.code);
    emit(WeatherFeatched(currentCondition: condition, weatherModel: weatherModel,));

    
  }
}


