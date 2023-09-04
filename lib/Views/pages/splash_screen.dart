import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wearther_app/Views/pages/home_screen.dart';

import '../../Blocs/weather/weather_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc,WeatherState>(
                builder: (context,state){
                          switch(state.runtimeType){
                            case LoadingState:
                              // print("Loading");
                                return  const Center(child: Text('Splash Screen',style: TextStyle(color: Colors.black),));
                            case WeatherFeatched:
                              return const HomeScreen();
                            default:
                            print("Error :/");
              
                            return const SizedBox();
                          }
                        },
                
              ),
    );
    
   
  }
}