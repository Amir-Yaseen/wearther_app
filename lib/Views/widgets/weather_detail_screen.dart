import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wearther_app/Views/pages/home_screen.dart';
import 'package:wearther_app/Views/widgets/custom_progress_bar.dart';
import 'package:wearther_app/Views/widgets/custom_small_card.dart';
import 'package:wearther_app/Views/widgets/sunrise_sunset.dart';
import 'package:wearther_app/const/style/color_pallete.dart';
import 'package:wearther_app/const/style/size_config.dart';

import '../../Models/weather_model.dart';
import 'hourly_forcast_widget.dart';
class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({
    super.key,
    required this.textstyle,
    required this.weatherFeatched,
    required this.isToday,
  });

  final TextTheme textstyle;
  final WeatherModel? weatherFeatched;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 15),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CustomSmallCard(
                textstyle: textstyle,
                text: 'Wind speed',
                subtext: isToday
                    ? "${weatherFeatched!.currentWeather!.windKph} km/h"
                    : "${weatherFeatched!.forecast!.forecastday![1].day!.maxwindKph} km/h",
                image: 'assets/icons/air.svg',
              ),
              CustomSmallCard(
                textstyle: textstyle,
                text: 'Rain chance',
                subtext: isToday
                    ? '${weatherFeatched!.forecast!.forecastday![0].day!.dailyChanceOfRain} %'
                    : '${weatherFeatched!.forecast!.forecastday![1].day!.dailyChanceOfRain} %',
                image: 'assets/icons/rainy.svg',
              ),
              CustomSmallCard(
                textstyle: textstyle,
                text: 'Pressure',
                subtext: isToday
                    ? "${weatherFeatched!.currentWeather!.humidity} in"
                    : "${weatherFeatched!.forecast!.forecastday![1].day!.humidity} in",
                image: 'assets/icons/waves.svg',
              ),
              CustomSmallCard(
                textstyle: textstyle,
                text: 'UV Index',
                subtext: isToday
                    ? "${weatherFeatched!.currentWeather!.uv} km/h"
                    : "${weatherFeatched!.forecast!.forecastday![1].day!.uv} km/h",
                image: 'assets/icons/light_mode.svg',
              ),
            ],
          ),
          HourlyForcastWidget(
            textstyle: textstyle,
            dayForcast: isToday
                ? weatherFeatched!.forecast!.forecastday![0].hour
                : weatherFeatched!.forecast!.forecastday![1].hour,
          ),
          const SizedBox(
            height: 20,
          ),
          // Container(
          //   width: getProportionateScreenWidth(360),
          //   height: getProportionateScreenHeight(350),
          //   decoration: BoxDecoration(
          //       color: Palette.cardpurple,
          //       borderRadius: BorderRadius.circular(18)),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //     child: Column(
          //       children: [
          //         Row(
          //           children: [
          //             CircleAvatar(
          //               backgroundColor: Palette.white,
          //               maxRadius: 15,
          //               child:
          //                   SvgPicture.asset('assets/icons/calendar_month.svg'),
          //             ),
          //             Padding(
          //               padding: EdgeInsets.symmetric(horizontal: 10),
          //               child: Text(
          //                 'Day forecast',
          //                 style: textstyle.labelSmall!
          //                     .copyWith(color: Palette.black),
          //               ),
          //             ),
          //           ],
          //         ),
          //         SfCartesianChart(
          //           primaryXAxis: CategoryAxis(
          //             majorGridLines: MajorGridLines(width: 0),
          //           ),
          //           // primaryYAxis: CategoryAxis(majorGridLines: MajorGridLines(width: 10)),
          //           series: <LineSeries<DayForcast, String>>[
          //             LineSeries<DayForcast, String>(
          //                 name: 'Forcast',
          //                 dataSource: dayForcastData,
          //                 xValueMapper: (datum, index) => datum.day,
          //                 yValueMapper: (datum, index) => datum.degree,
          //                 dataLabelSettings:
          //                     DataLabelSettings(isVisible: false))
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // ),

          //

          Container(
            width: getProportionateScreenWidth(360),
            height: getProportionateScreenHeight(280),
            decoration: BoxDecoration(
                color: Palette.cardpurple,
                borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Palette.white,
                        maxRadius: 15,
                        child: SvgPicture.asset('assets/icons/rainy.svg'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Chance of rain',
                          style: textstyle.labelSmall!
                              .copyWith(color: Palette.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(200),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: isToday
                          ? weatherFeatched!
                              .forecast!.forecastday![0].hour!.length
                          : weatherFeatched!
                              .forecast!.forecastday![1].hour!.length,
                      itemBuilder: (context, index) {
                        return isToday
                            ? CustomProgressBar(
                                chanceOfRain: weatherFeatched!.forecast!
                                    .forecastday![0].hour![index].chanceOfRain,
                                dayTime: weatherFeatched!
                                    .forecast!.forecastday![0].hour![index].time
                                    .toString(),
                                textstyle: textstyle,
                              )
                            : CustomProgressBar(
                                chanceOfRain: weatherFeatched!.forecast!
                                    .forecastday![1].hour![index].chanceOfRain,
                                dayTime: weatherFeatched!
                                    .forecast!.forecastday![1].hour![index].time
                                    .toString(),
                                textstyle: textstyle,
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isToday
                  ? SunRiseWidget(
                      textstyle: textstyle,
                      icon: 'assets/icons/nights_stay.svg',
                      text: 'Sunrise',
                      time: weatherFeatched!
                          .forecast!.forecastday![0].astro!.sunrise
                          .toString(),
                    )
                  : SunRiseWidget(
                      textstyle: textstyle,
                      icon: 'assets/icons/nights_stay.svg',
                      text: 'Sunrise',
                      time: weatherFeatched!
                          .forecast!.forecastday![1].astro!.sunrise
                          .toString(),
                    ),
              isToday
                  ? SunRiseWidget(
                      textstyle: textstyle,
                      icon: 'assets/icons/history_toggle_off.svg',
                      text: 'Sunset',
                      time: weatherFeatched!
                          .forecast!.forecastday![0].astro!.sunset
                          .toString())
                  : SunRiseWidget(
                      textstyle: textstyle,
                      icon: 'assets/icons/history_toggle_off.svg',
                      text: 'Sunset',
                      time: weatherFeatched!
                          .forecast!.forecastday![1].astro!.sunset
                          .toString())
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          )
        ],
      ),
    );
  }
}