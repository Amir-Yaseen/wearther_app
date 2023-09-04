import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wearther_app/const/constants.dart';
part 'selected_button_event.dart';
part 'selected_button_state.dart';

class SelectedButtonBloc extends Bloc<SelectedButtonEvent, SelectedButtonState> {
  SelectedButtonBloc() : super(TodayButtonState()) {
    on<ButtonTapEvent>(buttonTapEvent);
  }
  
  FutureOr<void> buttonTapEvent(ButtonTapEvent event, Emitter<SelectedButtonState> emit) {
   if(event.buttonType == ButtonType.today){
    emit(TodayButtonState()); 
   }
   if(event.buttonType == ButtonType.tomarrow){
    emit(TomarrowButtonState());
   }
   if(event.buttonType==ButtonType.tenDays){
    emit(TenDaysButtonState());
   }
  }
}
