import 'package:flutter/material.dart';
import 'package:wearther_app/const/style/color_pallete.dart';
import 'package:wearther_app/const/style/size_config.dart';

class CustomButton extends StatefulWidget {
   CustomButton({
    super.key,
    required this.textstyle, required this.isSelected, required this.text, required this.function,
  });

  final TextTheme textstyle;
  bool isSelected ;
  final String text;
  final Function function;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: (){
          setState(() {
            widget.isSelected = !widget.isSelected;
          });
          widget.function();
        },
        child: Container(
          width: getProportionateScreenWidth(116),
          height: getProportionateScreenHeight(42),
          decoration: BoxDecoration(
            color:widget.isSelected? Palette.purplrcard:Palette.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text(widget.text,style:widget.textstyle.labelMedium ,)),
        ),
      ),
    );
  }
}
