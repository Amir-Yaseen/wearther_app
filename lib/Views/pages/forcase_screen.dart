import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wearther_app/Views/widgets/custom_button.dart';
import 'package:wearther_app/Views/widgets/forcast_card.dart';
import 'package:wearther_app/const/constants.dart';
import 'package:wearther_app/const/style/color_pallete.dart';
import 'package:wearther_app/const/style/size_config.dart';

class ForcastScreen extends StatelessWidget {
  const ForcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textstyle = Theme.of(context).textTheme;
     SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Palette.appbackground,
      body: Column(
        children: [
          Container(
        width: getProportionateScreenWidth(377),
        height: getProportionateScreenHeight(268),
        decoration: BoxDecoration(
          color: Palette.cardpurple,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            right: 20,
            left: 20,
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Text('Kharkiv, Ukraine',style: textstyle.displaySmall,),
                  SvgPicture.asset('assets/icons/search.svg',color: Palette.black,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('3°',style: textstyle.displayMedium,),
                  Text('Feels Like -2',style: textstyle.labelMedium,)
                  ],
                ),
                SvgPicture.asset('assets/icons/sunandclouds.svg')
              ],),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SingleChildScrollView(
                  // padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                      children: [
                      CustomButton(textstyle: textstyle,isSelected: true, text: 'Today', function: (){},),
                      CustomButton(textstyle: textstyle,isSelected: false, text: 'Tomarrow', function: (){},),
                      CustomButton(textstyle: textstyle,isSelected: false, text: '10 Days', function: (){}),
                        ],),
                    ),
              ),
            ],
          ),
        ),
      ),
          SizedBox(
            height: getProportionateScreenHeight(543),
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: weekly_forcast.length,
              itemBuilder: (context ,index){
              return ForcastCard(textstyle: textstyle, day: weekly_forcast[index].day, dayweather: weekly_forcast[index].dayweather, degree1: weekly_forcast[index].degree1, degree2: weekly_forcast[index].degree2, image: weekly_forcast[index].image,);
            }),
          ),
        ],
      )
    );
  }
}

