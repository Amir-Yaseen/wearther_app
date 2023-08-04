import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wearther_app/router/route_names.dart';

import 'const/style/color_pallete.dart';

import 'router/app_routes.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:RouteGenerator.onGenerateRoute ,
      initialRoute:homeScreenRoute,
      navigatorKey: RouteGenerator.navigatorkey,
      theme: ThemeDataCustom(),
      //
    );
  }

  ThemeData ThemeDataCustom() {
    return ThemeData(
brightness: Brightness.light,
useMaterial3: true,
primaryColor: Palette.appbackground,

textTheme: GoogleFonts.dmSansTextTheme().copyWith(
  bodyLarge: GoogleFonts.dmSans(
    textStyle: const TextStyle(color: Palette.white,fontSize: 112,)
  ),
  displayMedium: GoogleFonts.roboto(
    textStyle: const TextStyle(color: Palette.black, fontSize: 57),
  ),
  displaySmall: GoogleFonts.dmSans(
    textStyle:const TextStyle(color: Palette.black,fontSize: 22),
  ),
  headlineMedium: GoogleFonts.dmSans(
    textStyle: const TextStyle(color: Palette.white,fontSize: 18)
  ),
  labelMedium: GoogleFonts.dmSans(
    textStyle: const TextStyle(color: Palette.black,fontSize: 16)
  ),
  headlineSmall: GoogleFonts.dmSans(textStyle:const TextStyle(
    color: Palette.white,fontSize: 18,
  )),
  labelSmall: GoogleFonts.dmSans(textStyle:const TextStyle(
    color: Palette.white,fontSize: 14,
  )),
  bodyMedium: GoogleFonts.abel(textStyle:const TextStyle(
    color: Palette.white,fontSize: 16,
  )),
  bodySmall: GoogleFonts.abel(textStyle:const TextStyle(
    color: Palette.white,fontSize: 11,
  )),
  titleLarge: GoogleFonts.abel(textStyle:const TextStyle(
    color: Palette.white,fontSize: 19,
  )),
  titleMedium: GoogleFonts.abel(textStyle:const TextStyle(
    color: Palette.white,fontSize: 13,
  )),
  titleSmall: GoogleFonts.abel(textStyle:const TextStyle(
    color: Palette.white,fontSize: 10,
  )),

),
);
  }
}