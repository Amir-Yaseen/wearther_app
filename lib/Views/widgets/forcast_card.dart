import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wearther_app/const/style/color_pallete.dart';
import 'package:wearther_app/const/style/size_config.dart';

class ForcastCard extends StatelessWidget {
   const ForcastCard({
    super.key,
    required this.textstyle,
    required this.degree1,
    required this.degree2,
    required this.day,
    required this.dayweather,
    required this.image
  });

  final TextTheme textstyle;
  final int degree1;
  final int degree2;
  final String day;
  final String dayweather;
  final String image;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
        width: getProportionateScreenWidth(377),
        height: getProportionateScreenHeight(84),
        decoration: BoxDecoration(
          color: Palette.cardpurple,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Today',style: textstyle.labelMedium!.copyWith(fontWeight: FontWeight.w600),),
                  Text('Coludy nd Sunny',style: textstyle.labelMedium!.copyWith(fontWeight: FontWeight.w500))
                ],
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('3°',style:  textstyle.labelMedium,),
                      Text('-2°',style: textstyle.labelMedium,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 40,
                      width: 1,
                      color: Color(0xff4B454D),
                    ),
                  ),
                  SvgPicture.asset('assets/icons/cloud.svg'),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Palette.white,
                    child: SvgPicture.asset('assets/icons/expand_more.svg'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}