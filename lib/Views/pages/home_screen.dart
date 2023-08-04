import 'package:flutter/material.dart';
import 'package:wearther_app/Views/widgets/custom_button.dart';
import 'package:wearther_app/Views/widgets/custom_small_card.dart';
import 'package:wearther_app/Views/widgets/hourly_forcast_widget.dart';
import 'package:wearther_app/Views/widgets/top_home_section.dart';
import 'package:wearther_app/const/style/color_pallete.dart';
import 'package:wearther_app/const/style/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textstyle = Theme.of(context).textTheme;
    SizeConfig().init(context);
    return  Scaffold(
      backgroundColor: Palette.appbackground,
      body: Column(
        children: [
          TopHomeSection(textstyle: textstyle),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                    children: [
                    CustomButton(textstyle: textstyle,isSelected: true, text: 'Today',),
                    CustomButton(textstyle: textstyle,isSelected: false, text: 'Tomarrow',),
                    CustomButton(textstyle: textstyle,isSelected: false, text: '10 Days',),
                      ],),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(130),
                        width: double.infinity,
                        child: GridView.count(crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        
                        children: [
                          CustomSmallCard(textstyle: textstyle,text: 'Wind speed',subtext: '12km/h',smalltext: '2 km/h', image: 'assets/icons/air.svg',),
                          CustomSmallCard(textstyle: textstyle,text: 'Rain chance',subtext: '24%',smalltext: '10%', image: 'assets/icons/rainy.svg',),
                          CustomSmallCard(textstyle: textstyle,text: 'Pressure',subtext: '720 hpa',smalltext: '32 hpa', image: 'assets/icons/waves.svg',),
                          CustomSmallCard(textstyle: textstyle,text: 'UV Index',subtext: '2,3',smalltext: '0.3', image: 'assets/icons/light_mode.svg',),
                        ],
                        ),
                      ),
                    ],
                  ),
                ),
                HourlyForcastWidget(textstyle: textstyle),
                // HourlyForcastWidget(textstyle: textstyle)
              ],
            ),
          )
          
        ],
      )
    );
  }
}






