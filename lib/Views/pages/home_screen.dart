import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wearther_app/Blocs/category/bloc/selected_button_bloc.dart';
import 'package:wearther_app/Blocs/weather/weather_bloc.dart';
import 'package:wearther_app/Models/weather_model.dart';
import 'package:wearther_app/Views/widgets/custom_button.dart';
import 'package:wearther_app/Views/widgets/custom_small_card.dart';
import 'package:wearther_app/Views/widgets/hourly_forcast_widget.dart';
import 'package:wearther_app/Views/widgets/top_home_section.dart';
import 'package:wearther_app/const/constants.dart';
import 'package:wearther_app/const/style/color_pallete.dart';
import 'package:wearther_app/const/style/size_config.dart';

import '../widgets/custom_progress_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final WeatherBloc weatherBloc = WeatherBloc();

  @override
  void initState() {
    // weatherBloc.add(WeatherInitialFeatchEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textstyle = Theme.of(context).textTheme;
    // WeatherFeatched weatherFeatched;
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Palette.appbackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopHomeSection(
                textstyle: textstyle,
                weatherModel: context.read<WeatherBloc>().weatherModel,
                currentCondition: context.read<WeatherBloc>().condition,
              ),
              HomeFullScreen(textstyle: textstyle),
            ],
          ),
        ));
  }
}

class HomeFullScreen extends StatelessWidget {
  HomeFullScreen({super.key, required this.textstyle});

  final TextTheme textstyle;
  bool isSelected = false;
  // final WeatherFeatched weatherFeatched;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
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
                        CustomButton(
                          textstyle: textstyle,
                          isSelected: isSelected,
                          text: 'Today',
                          function: () {
                            context.read<SelectedButtonBloc>().add(
                                ButtonTapEvent(buttonType: ButtonType.today));
                          },
                        ),
                        CustomButton(
                          textstyle: textstyle,
                          isSelected: false,
                          text: 'Tomarrow',
                          function: () {
                            context.read<SelectedButtonBloc>().add(
                                ButtonTapEvent(
                                    buttonType: ButtonType.tomarrow));
                          },
                        ),
                        CustomButton(
                          textstyle: textstyle,
                          isSelected: false,
                          text: '10 Days',
                          function: () {
                            context.read<SelectedButtonBloc>().add(
                                ButtonTapEvent(buttonType: ButtonType.tenDays));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<SelectedButtonBloc, SelectedButtonState>(
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case TodayButtonState:
                        // print("Loading");
                        return WeatherDetailsScreen(
                          textstyle: textstyle,
                          weatherFeatched:
                              context.read<WeatherBloc>().weatherModel,
                          isToday: true,
                        );
                      case TomarrowButtonState:
                        return WeatherDetailsScreen(
                          textstyle: textstyle,
                          weatherFeatched:
                              context.read<WeatherBloc>().weatherModel,
                          isToday: false,
                        );
                      //  final weatherFeatched = state as WeatherFeatched;
                      // print("weather location${weatherLocation.currentWeather\}");
                      // return const Center(
                      //     child: Text('Tomarrow',
                      //         style: TextStyle(color: Colors.black)));
                      case TenDaysButtonState:
                        //  final weatherFeatched = state as WeatherFeatched;
                        // print("weather location${weatherLocation.currentWeather\}");
                        return ForcastDaysList(textstyle: textstyle, forecast: context.read<WeatherBloc>().weatherModel!.forecast,);
                      default:
                        print("Error :/");

                        return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ForcastDaysList extends StatelessWidget {
  const ForcastDaysList({
    super.key,
    required this.textstyle, required this.forecast,
  });

  final TextTheme textstyle;
  final Forecast? forecast;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: getProportionateScreenHeight(370),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 5),
          itemCount: forecast!.forecastday!.length,
          itemBuilder:(context, index) {
            return ForcastDayCard(textstyle: textstyle, forecastday: forecast!.forecastday![index],);
        },),
      ),
    );
  }
}

class ForcastDayCard extends StatelessWidget {
  const ForcastDayCard({
    super.key,
    required this.textstyle, required this.forecastday,
  });

  final TextTheme textstyle;
  final Forecastday forecastday;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: getProportionateScreenWidth(360),
        height: getProportionateScreenHeight(84),
        decoration: BoxDecoration(
            color: Palette.cardpurple,
            borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Today',style: textstyle.bodyMedium!.copyWith(color: Palette.black,fontWeight: FontWeight.w600),),
                  Text(forecastday.day!.condition!.text.toString(),style: textstyle.bodyMedium!.copyWith(color: Palette.black,))
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecastday.day!.maxtempC!.toStringAsFixed(0)}℃",style: textstyle.bodyMedium!.copyWith(color: Palette.black,fontWeight: FontWeight.w600)),
                      Text("${forecastday.day!.mintempC!.toStringAsFixed(0)}℃",style: textstyle.bodyMedium!.copyWith(color: Palette.black,fontWeight: FontWeight.w600)),
                    ],
                  ),
              
                  Padding(
                    padding: const EdgeInsets.only(top:20),
                    child: Row(
                      children: [
                        Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        color: Palette.black,
                        width: 1,height: 30,
                      ),
                    ),
                    SvgPicture.asset('assets/icons/cloud.svg',width: 50,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: CircleAvatar(
                      backgroundColor: Palette.white,
                      radius: 10,
                      child: SvgPicture.asset('assets/icons/expand_more.svg'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

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

class SunRiseWidget extends StatelessWidget {
  const SunRiseWidget({
    super.key,
    required this.textstyle,
    required this.text,
    required this.icon,
    required this.time,
  });

  final TextTheme textstyle;
  final String text;
  final String icon;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(170),
      height: getProportionateScreenHeight(65),
      decoration: BoxDecoration(
          color: Palette.cardpurple, borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Palette.white,
              child: SvgPicture.asset(icon),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: textstyle.labelSmall!.copyWith(color: Palette.black),
                ),
                Text(time,
                    style: textstyle.labelSmall!.copyWith(
                        color: Palette.black, fontWeight: FontWeight.w600))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(22)),
              child: Text(
                '4h ago',
                style: textstyle.titleMedium!.copyWith(color: Palette.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
