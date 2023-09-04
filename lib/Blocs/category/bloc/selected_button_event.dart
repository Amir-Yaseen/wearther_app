part of 'selected_button_bloc.dart';

@immutable
sealed class SelectedButtonEvent {}
class ButtonTapEvent extends SelectedButtonEvent{
  final ButtonType? buttonType;
  ButtonTapEvent({this.buttonType});

}
