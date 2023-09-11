import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wearther_app/Blocs/bloc/navigator_bloc.dart';
import 'package:wearther_app/Blocs/category/bloc/selected_button_bloc.dart';
import 'package:wearther_app/Blocs/weather/weather_bloc.dart';
import 'package:wearther_app/Models/forcastNavidationModel.dart';
import 'package:wearther_app/Models/weather_model.dart';
import 'package:wearther_app/Views/widgets/custom_button.dart';
import 'package:wearther_app/Views/widgets/top_home_section.dart';
import 'package:wearther_app/Views/widgets/weather_detail_screen.dart';
import 'package:wearther_app/const/constants.dart';
import 'package:wearther_app/const/style/color_pallete.dart';
import 'package:wearther_app/const/style/size_config.dart';
import '../../Models/current_condition.dart';

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
                          // textstyle: textstyle,
                         
                          forcastNavigationModel: ForcastNavigationModel(isToday: true, textstyle: textstyle, weatherFeatched: context.read<WeatherBloc>().weatherModel,),
                        );
                      case TomarrowButtonState:
                        return WeatherDetailsScreen(
                          // textstyle: textstyle,
                         
                          forcastNavigationModel: ForcastNavigationModel(isToday: false, textstyle: textstyle, weatherFeatched: context.read<WeatherBloc>().weatherModel,),
                        );
                      //  final weatherFeatched = state as WeatherFeatched;
                      // print("weather location${weatherLocation.currentWeather\}");
                      // return const Center(
                      //     child: Text('Tomarrow',
                      //         style: TextStyle(color: Colors.black)));
                      case TenDaysButtonState:
                        //  final weatherFeatched = state as WeatherFeatched;
                        // print("weather location${weatherLocation.currentWeather\}");
                        return ForcastDaysList(textstyle: textstyle, weatherModel: context.read<WeatherBloc>().weatherModel,);
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
   ForcastDaysList({
    super.key,
    required this.textstyle, required this.weatherModel,
  });

  final TextTheme textstyle;
  final WeatherModel? weatherModel;
  int? isDay;
  CurrentCondition? currentCondition;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: getProportionateScreenHeight(370),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 5),
          itemCount: weatherModel!.forecast!.forecastday!.length,
          itemBuilder:(context, index) {
             currentCondition = context
                          .read<WeatherBloc>()
                          .conditionList!
                          .firstWhere((element) =>
                              element.code ==
                              weatherModel!.forecast!.forecastday![index].day!.condition!.code);
             isDay = weatherModel!.currentWeather!.isDay;
            return ForcastDayCard(textstyle: textstyle, forecastday:weatherModel!.forecast!.forecastday![index],currentCondition: currentCondition,isDay: isDay,);
        },),
      ),
    );
  }
}

class ForcastDayCard extends StatelessWidget {
  const ForcastDayCard({
    super.key,
    required this.textstyle, required this.forecastday, required this.currentCondition, required this.isDay,
  });

  final TextTheme textstyle;
  final Forecastday forecastday;
  final CurrentCondition? currentCondition;
  final int? isDay;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: (){
         context.read<NavigatorBloc>().add(
                                ForcastCardSelected(isToday:true, textstyle: textstyle,weatherFeatched:context.read<WeatherBloc>().weatherModel ,));
        },
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
                      isDay==1?
                      Image.asset('assets/icons/day/${currentCondition!.icon}.png',width: 50,):
                      Image.asset('assets/icons/night/${currentCondition!.icon}.png',width: 50,),
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
      ),
    );
  }
}




