import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wearther_app/const/style/color_pallete.dart';
import 'package:wearther_app/const/style/size_config.dart';

class TopHomeSection extends StatelessWidget {
  const TopHomeSection({
    super.key,
    required this.textstyle,
  });

  final TextTheme textstyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(375),
      child: Container(
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
          image:DecorationImage(image:AssetImage('assets/images/hometoppicture.png'),fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Kharkiv, Ukraine',style:textstyle.displaySmall!.copyWith(color: Palette.white),),
                  SvgPicture.asset('assets/icons/search.svg')
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                  Text('3°',style: textstyle.bodyLarge,),
                Padding(
                  padding: const EdgeInsets.only(top:50),
                  child: Text('Feels like -2°',style: textstyle.headlineMedium,),
                )
                ],),
                Column(
                  children: [
                    SvgPicture.asset('assets/icons/sunandclouds.svg'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text('Cloudy',style: textstyle.displaySmall!.copyWith(color: Palette.white),),
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
                Text('January 18, 16:14',style: textstyle.headlineMedium,),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Day 3°',style: textstyle.headlineMedium,),
                    SizedBox(height: getProportionateScreenHeight(5),),
                    Text('Night -1°',style: textstyle.headlineMedium),
                    
                    ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}