import 'package:flutter/material.dart';

import '../../const/style/color_pallete.dart';
import '../../const/style/size_config.dart';

class CustomProgressBar extends StatelessWidget {
  final int? chanceOfRain;
  final String dayTime;
  final TextTheme textstyle;
  int? totalStringLength;
  String? date;
  String? time;
  int? timeToInt;
  String? currentTime;
  CustomProgressBar({
    super.key,
    required this.chanceOfRain,
    required this.dayTime, required this.textstyle
  });

  @override
  Widget build(BuildContext context) {
  totalStringLength = dayTime.length;
  // print(totalStringLength);
  //  date = dayTime.substring(0, 10);
   time = dayTime.substring(11, 13);
   timeToInt = int.parse(time.toString())+1;
                      if (timeToInt! <= 12) {
                        currentTime = '${timeToInt} AM';
                      } else {
                        
                        currentTime = '${timeToInt!-12} PM';
                      } //
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(currentTime.toString(),style:textstyle.titleLarge!.copyWith(color: Palette.black)),
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 10,top: 25),
          child: Stack(
            children: [
              Container(
                    width: getProportionateScreenWidth(220),
              height: getProportionateScreenHeight(24),
             decoration: BoxDecoration(
                  color: Palette.appbackground,
                  borderRadius: BorderRadius.circular(100)),
                  ),
                  Container(
                 width: chanceOfRain!*getProportionateScreenHeight(2.20),
                 height: getProportionateScreenHeight(24),
                 decoration: BoxDecoration(
                    color: Palette.darkpurple,
                    borderRadius: BorderRadius.circular(100)),
                    ),
            ],
            
          ),
        ),
      Text("${chanceOfRain}%",style:textstyle.titleLarge!.copyWith(color: Palette.black,fontWeight: FontWeight.w600),)
                
      ],
    );
  }
}