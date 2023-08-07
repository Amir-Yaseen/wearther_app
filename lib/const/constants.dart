import 'package:wearther_app/Models/day_forcast.dart';
import 'package:wearther_app/Models/hourly_forcast.dart';

 List<HourlyForacst> hourlyForcastList = [
  HourlyForacst(time: 'Now', tempereature: '10°', image: 'assets/icons/sun.svg'),
  HourlyForacst(time: '10AmM', tempereature: '8°', image: 'assets/icons/cloud.svg'),
  HourlyForacst(time: '11AM', tempereature: '5°', image: 'assets/icons/sun.svg'),
  HourlyForacst(time: '12PM', tempereature: '6°', image: 'assets/icons/cloud.svg'),
  HourlyForacst(time: '1PM', tempereature: '4°', image: 'assets/icons/sun.svg'),
  HourlyForacst(time: '2PM', tempereature: '12°', image: 'assets/icons/cloud.svg'),
 ];

 List<DayForcast> dayForcastData =[
  DayForcast(degree: 10, day: 'Mon'),
  DayForcast(degree: 8, day: 'Tue'),
  DayForcast(degree: 0, day: 'Wed'),
  DayForcast(degree: 2, day: 'Thu'),
  DayForcast(degree: 7, day: 'Fri'),
  DayForcast(degree: 4, day: 'Sat'),
  DayForcast(degree: 9, day: 'Sun')
 ];