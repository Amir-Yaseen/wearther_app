import 'package:flutter/material.dart';
import 'package:wearther_app/const/style/color_pallete.dart';
import 'package:wearther_app/const/style/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.textstyle, required this.isSelected, required this.text, required this.function,
  });

  final TextTheme textstyle;
  final bool isSelected;
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: (){
          function();
        },
        child: Container(
          width: getProportionateScreenWidth(116),
          height: getProportionateScreenHeight(42),
          decoration: BoxDecoration(
            color:isSelected? Palette.purplrcard:Palette.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text(text,style:textstyle.labelMedium ,)),
        ),
      ),
    );
  }
}
