import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wearther_app/Models/current_condition.dart';
import 'package:wearther_app/const/style/color_pallete.dart';
import 'package:wearther_app/const/style/size_config.dart';

import '../../Models/weather_model.dart';

class TopHomeSection extends StatelessWidget {
   TopHomeSection({
    super.key,
    required this.textstyle, required this.weatherModel, required this.currentCondition,
  });

  final TextTheme textstyle;
  final WeatherModel? weatherModel;
  final CurrentCondition? currentCondition;
   String? locationDateTime ;
    String? date;
   String? time;
   int? totalStringLength;

  

  @override
  Widget build(BuildContext context) {

  locationDateTime = weatherModel!.location!.localtime;
  totalStringLength = locationDateTime!.length;
  // print(totalStringLength);
   date = locationDateTime!.substring(0, 10);
   time = locationDateTime!.substring(11, totalStringLength);

    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(375),
      child: Container(
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
          image:DecorationImage(image:AssetImage('assets/images/hometoppicture.png'),fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${weatherModel!.location!.name},${weatherModel!.location!.country}',style:textstyle.displaySmall!.copyWith(color: Palette.white),),
                  SvgPicture.asset('assets/icons/search.svg')
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('${weatherModel!.currentWeather!.tempC!.toStringAsFixed(0)}°',style: textstyle.bodyLarge,),
                Text('Feels like ${weatherModel!.currentWeather!.feelslikeC!.toStringAsFixed(0)}°',style: textstyle.headlineMedium,)
                ],),
                Column(
                  children: [
                    weatherModel!.currentWeather!.isDay==1?
                    Image.asset('assets/icons/day/${currentCondition!.icon}.png'):
                    Image.asset('assets/icons/night/${currentCondition!.icon}.png'),
                    SizedBox(
                      width: 90,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: 
                        weatherModel!.currentWeather!.isDay==1?
                        Text(textAlign: TextAlign.center,'${currentCondition!.day}',style: textstyle.labelMedium!.copyWith(color: Palette.white),):
                        Text(textAlign: TextAlign.center,'${currentCondition!.night}',style: textstyle.labelMedium!.copyWith(color: Palette.white),),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(time.toString(),style: textstyle.headlineMedium,),
                   SizedBox(height: getProportionateScreenHeight(5),),
                  Text(date.toString(),style: textstyle.headlineMedium,),
                  ],
                ),
                weatherModel!.currentWeather!.isDay==1?
                Text('Day',style: textstyle.headlineMedium,):
                Text('Night',style: textstyle.headlineMedium,),
                
              ],
            )
          ]),
        ),
      ),
    );
  }
}