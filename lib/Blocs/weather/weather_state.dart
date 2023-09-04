part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

sealed class WeatherActionState extends WeatherState{}

final class LoadingState extends WeatherState {}

final class WeatherFeatched extends WeatherState {
  final WeatherModel? weatherModel;
  // final Location? location;
  // final CurrentWeather? currentWeather;
  // final List<Forecastday>? forecastday;
  final CurrentCondition? currentCondition;
  WeatherFeatched(
    {
   required this.weatherModel, 
  //  this.location,this.currentWeather,this.forecastday,
   this.currentCondition
  }
  );
}

// final class TodayButtonState extends WeatherState{

// }
// final class TomarrowButtonState extends WeatherState{

// }
// final class TenDaysButtonState extends WeatherState{

// }


// final class WeatherLocation extends WeatherState {
//   final Location? location;
//   final CurrentWeather? currentWeather;
//   final CurrentCondition? currentCondition;
//   WeatherLocation({required this.location,required this.currentWeather,required this.currentCondition});
// }
// final class WeatherForcast extends WeatherState {
//   final List<Forecastday>? forcastedDay;
//   WeatherForcast({required this.forcastedDay});
// }
