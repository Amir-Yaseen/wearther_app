
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:wearther_app/Models/day_forcast.dart';
import 'package:wearther_app/Views/widgets/custom_button.dart';
import 'package:wearther_app/Views/widgets/custom_small_card.dart';
import 'package:wearther_app/Views/widgets/hourly_forcast_widget.dart';
import 'package:wearther_app/Views/widgets/top_home_section.dart';
import 'package:wearther_app/const/constants.dart';
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TopHomeSection(textstyle: textstyle),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
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
                        GridView.count(crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 3,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                    physics: const NeverScrollableScrollPhysics(),
                                    
                                    children: [
                                      CustomSmallCard(textstyle: textstyle,text: 'Wind speed',subtext: '12km/h',smalltext: '2 km/h', image: 'assets/icons/air.svg',),
                                      CustomSmallCard(textstyle: textstyle,text: 'Rain chance',subtext: '24%',smalltext: '10%', image: 'assets/icons/rainy.svg',),
                                      CustomSmallCard(textstyle: textstyle,text: 'Pressure',subtext: '720 hpa',smalltext: '32 hpa', image: 'assets/icons/waves.svg',),
                                      CustomSmallCard(textstyle: textstyle,text: 'UV Index',subtext: '2,3',smalltext: '0.3', image: 'assets/icons/light_mode.svg',),
                                    ],
                                    ),
                                    HourlyForcastWidget(textstyle: textstyle),
                                    Container(
      width: getProportionateScreenWidth(360),
      height:getProportionateScreenHeight(350),
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
                CircleAvatar(backgroundColor: Palette.white,maxRadius: 15,child: SvgPicture.asset('assets/icons/calendar_month.svg'),),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Day forecast',style: textstyle.labelSmall!.copyWith(color: Palette.black),),
                ),
              ],
            ),
            SfCartesianChart(
              
              primaryXAxis: CategoryAxis(majorGridLines: MajorGridLines(width: 0),),
              // primaryYAxis: CategoryAxis(majorGridLines: MajorGridLines(width: 10)),
              series: <LineSeries<DayForcast,String>>[
                LineSeries<DayForcast,String>(
                  name: 'Forcast',
                  dataSource: dayForcastData,
                  xValueMapper:(datum, index) =>datum.day ,
                  yValueMapper: (datum, index) => datum.degree ,
                  dataLabelSettings: DataLabelSettings(isVisible: false)
                )
              ],
              // primaryXAxis: CategoryAxis(majorGridLines: MajorGridLines(width: 0)),
              // primaryYAxis: CategoryAxis(majorGridLines: MajorGridLines(width: 0)) ,
            )
            // SfSparkLineChart(
              
            //     data: const [
            //       1,
            //       2,
            //       3
            //     ],
            //     color: Colors.amber,
            //     width: 1,
            //     axisLineColor: Colors.transparent,
              
            //   ),
            
          ],
        ),
      ) ,
    ),
                      ],
                    ),
                  )
                 
                ],
              ),
            )
            
          ],
        ),
      )
    );
  }
}






