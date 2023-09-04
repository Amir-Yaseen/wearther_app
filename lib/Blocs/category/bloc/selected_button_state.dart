part of 'selected_button_bloc.dart';

@immutable
sealed class SelectedButtonState {}

final class SelectedButtonInitial extends SelectedButtonState {

}

final class TodayButtonState extends SelectedButtonState{


  TodayButtonState();

}
final class TomarrowButtonState extends SelectedButtonState{

}
final class TenDaysButtonState extends SelectedButtonState{

}