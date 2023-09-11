part of 'navigator_bloc.dart';

@immutable
sealed class NavigatorEvent {}

class ForcastCardSelected extends NavigatorEvent{
  final bool isToday;
  final TextTheme textstyle;
  final WeatherModel? weatherFeatched;
  ForcastCardSelected({required this.isToday,required this.textstyle,required this.weatherFeatched});
}