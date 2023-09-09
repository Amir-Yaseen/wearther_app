import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wearther_app/Blocs/weather/weather_bloc.dart';
import 'package:wearther_app/Models/weather_model.dart';
import 'package:wearther_app/const/style/color_pallete.dart';
import 'package:wearther_app/const/style/size_config.dart';

import '../../Models/current_condition.dart';

class HourlyForcastWidget extends StatelessWidget {
  HourlyForcastWidget({
    super.key,
    required this.textstyle,
    required this.dayForcast,
  });

  final TextTheme textstyle;
  final List<Hour>? dayForcast;
  String? locationDateTime;
  int? totalStringLength;
  int? timeToInt;
  String? currentTime;
  String? time;
  CurrentCondition? currentCondition;

  @override
  Widget build(BuildContext context) {
    // condition = currentCondition!.firstWhere((element) => element.code == weatherModel!.currentWeather!.condition!.code);

    return Container(
      width: getProportionateScreenWidth(360),
      height: getProportionateScreenHeight(180),
      decoration: BoxDecoration(
          color: Palette.cardpurple, borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Palette.white,
                  child:
                      SvgPicture.asset('assets/icons/history_toggle_off.svg'),
                  maxRadius: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Hourly forecast',
                    style: textstyle.labelSmall!.copyWith(color: Palette.black),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: getProportionateScreenHeight(110),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dayForcast!.length,
                    itemBuilder: (context, index) {
                      currentCondition = context
                          .read<WeatherBloc>()
                          .conditionList!
                          .firstWhere((element) =>
                              element.code ==
                              dayForcast![index].condition!.code);
                      locationDateTime = dayForcast![index].time;
                      totalStringLength = locationDateTime!.length;
                      // date = locationDateTime!.substring(0, 10);
                      time = locationDateTime!.substring(11, 13);
                      //
                      timeToInt = int.parse(time.toString())+1;
                      if (timeToInt! <= 12) {
                        currentTime = '${timeToInt} AM';
                      } else {
                        
                        currentTime = '${timeToInt!-12} PM';
                      } //
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Text(
                              (currentTime).toString(),
                              style: textstyle.titleMedium!
                                  .copyWith(color: Palette.black),
                            ),
                            Image.asset(
                              'assets/icons/day/${currentCondition!.icon}.png',
                              width: getProportionateScreenWidth(50),
                            ),
                            Text(
                              dayForcast![index].tempC.toString(),
                              style: textstyle.titleLarge!
                                  .copyWith(color: Palette.black),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
