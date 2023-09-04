part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class WeatherInitialFeatchEvent extends WeatherEvent{

}

// class ButtonTapEvent extends WeatherEvent{
//   ButtonType? buttonType;
//   ButtonTapEvent({ButtonType? buttonType}):buttonType=buttonType?? ButtonType.today; 

// }