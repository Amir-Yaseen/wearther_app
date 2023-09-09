import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wearther_app/const/style/color_pallete.dart';
import 'package:wearther_app/const/style/size_config.dart';
class SunRiseWidget extends StatelessWidget {
  const SunRiseWidget({
    super.key,
    required this.textstyle,
    required this.text,
    required this.icon,
    required this.time,
  });

  final TextTheme textstyle;
  final String text;
  final String icon;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(170),
      height: getProportionateScreenHeight(65),
      decoration: BoxDecoration(
          color: Palette.cardpurple, borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Palette.white,
              child: SvgPicture.asset(icon),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: textstyle.labelSmall!.copyWith(color: Palette.black),
                ),
                Text(time,
                    style: textstyle.labelSmall!.copyWith(
                        color: Palette.black, fontWeight: FontWeight.w600))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(22)),
              child: Text(
                '4h ago',
                style: textstyle.titleMedium!.copyWith(color: Palette.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}