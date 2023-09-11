import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:wearther_app/Models/forcastNavidationModel.dart';
import 'package:wearther_app/Models/weather_model.dart';

part 'navigator_event.dart';
part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorState> {
  final GlobalKey<NavigatorState> navigatorKey;
  NavigatorBloc({required this.navigatorKey}) : super(NavigatorInitial()) {
    on<ForcastCardSelected>(forcastCardSelected);
  }

  FutureOr<void> forcastCardSelected(ForcastCardSelected event, Emitter<NavigatorState> emit) {
  navigatorKey.currentState!.pushNamed('/weather_detail_route',arguments:ForcastNavigationModel(isToday: event.isToday, textstyle: event.textstyle, weatherFeatched: event.weatherFeatched));
  }
}
