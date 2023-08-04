import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wearther_app/const/constants.dart';
import 'package:wearther_app/const/style/color_pallete.dart';
import 'package:wearther_app/const/style/size_config.dart';

class HourlyForcastWidget extends StatelessWidget {
  const HourlyForcastWidget({
    super.key,
    required this.textstyle,
  });

  final TextTheme textstyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: getProportionateScreenWidth(360),
        height:getProportionateScreenHeight(150),
        decoration: BoxDecoration(
          color: Palette.cardpurple,
          borderRadius: BorderRadius.circular(18)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundColor: Palette.white,child: SvgPicture.asset('assets/icons/history_toggle_off.svg'),maxRadius: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Hourly forecast',style: textstyle.labelSmall!.copyWith(color: Palette.black),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: getProportionateScreenHeight(80),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hourlyForcastList.length,
                
                    itemBuilder:  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 60,
                        width: 40,
                        child: Column(
                          children: [
                            Text(hourlyForcastList[index].time,style: textstyle.titleMedium!.copyWith(color: Palette.black),),
                            SvgPicture.asset(hourlyForcastList[index].image),
                            Text(hourlyForcastList[index].tempereature,style: textstyle.titleLarge!.copyWith(color: Palette.black),),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ) ,
      ),
    );
  }
}