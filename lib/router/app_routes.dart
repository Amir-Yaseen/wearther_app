import 'package:flutter/material.dart';
import 'package:wearther_app/Views/pages/forcase_screen.dart';
import 'package:wearther_app/Views/pages/home_screen.dart';
import 'package:wearther_app/Views/pages/splash_screen.dart';
import 'package:wearther_app/Views/pages/testing.dart';
import 'package:wearther_app/router/route_names.dart';

class RouteGenerator{
  static GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
  static Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case splashRoute:
        return MaterialPageRoute(builder: (_)=> const SplashScreen());
      case homeScreenRoute:
        return MaterialPageRoute(builder: (_)=> const HomeScreen());
      case forcaseScreenRoute:
        return MaterialPageRoute(builder: (_)=> const ForcastScreen());
      // case testing:
      //   return MaterialPageRoute(builder: (_)=> const TESTING());
      default :
      return _errorRoute();
    }
  }

  
  static Route<dynamic> _errorRoute() {
    MediaQueryData mediaQuery =
        MediaQuery.of(navigatorkey.currentContext as BuildContext);
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              height: mediaQuery.size.height,
              width: mediaQuery.size.width,
              alignment: Alignment.center,
              // color: Palette.aliceBlue,
              child: Column(
                children: [
                  const Text('Error Loading Page'),
                  GestureDetector(
                    onTap: () {
                      // navigatorKey.currentState!
                      //   .pushNamedAndRemoveUntil(splashRoute, (route) => false)
                    },
                    child: Container(
                      width: mediaQuery.size.width * 0.82,
                      padding: EdgeInsets.symmetric(
                          vertical: mediaQuery.size.width * 0.04,
                          horizontal: 0.0),
                      child: const Text('Go Back'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}