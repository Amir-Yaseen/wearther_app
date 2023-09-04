import 'package:wearther_app/Models/day_forcast.dart';
import 'package:wearther_app/Models/hourly_forcast.dart';
import 'package:wearther_app/Models/weekly_forcast.dart';

enum ButtonType {today,tomarrow,tenDays}
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


 List<WeeklyForcast> weekly_forcast=[
  WeeklyForcast(day: 'Today', degree1: 3, degree2: 2, dayweather: 'Cloudy and Sunny', image: 'assets/icons/sunandclouds.svg'),
  WeeklyForcast(day: 'Thursday,Jan 19', degree1: 3, degree2: 2, dayweather: 'Cloudy', image: 'assets/icons/cloud.svg'),
  WeeklyForcast(day: 'Fridy Jan 20', degree1: 3, degree2: 2, dayweather: 'Sunny', image: 'assets/icons/cloud.svg'),
  WeeklyForcast(day: 'Saturday Jan 21', degree1: 3, degree2: 2, dayweather: 'Cloudy and Sunny', image: 'assets/icons/sunandclouds.svg'),
  WeeklyForcast(day: 'Sunday Jan 22', degree1: 3, degree2: 2, dayweather: 'Sunny', image: 'assets/icons/cloud.svg'),
  WeeklyForcast(day: 'Monday Jan 23', degree1: 3, degree2: 2, dayweather: 'Cloudy', image: 'assets/icons/cloud.svg'),
  WeeklyForcast(day: 'Tuesday Jan 24', degree1: 3, degree2: 2, dayweather: 'Cloudy and Sunny', image: 'assets/icons/sunandclouds.svg'),
 ];