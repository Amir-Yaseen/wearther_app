import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wearther_app/const/style/color_pallete.dart';

class CustomSmallCard extends StatelessWidget {
  const CustomSmallCard({
    super.key,
    required this.textstyle, required this.text, required this.subtext, required this.smalltext, required this.image,
  });

  final TextTheme textstyle;
  final String text;
  final String subtext;
  final String smalltext;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Palette.cardpurple,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 15,
              backgroundColor: Palette.white,
              child: SvgPicture.asset(image),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text,style: textstyle.labelSmall!.copyWith(color: Palette.black),),
                  Text(subtext,style: textstyle.bodyMedium!.copyWith(color:const Color(0xff1E1B1B)),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(smalltext,style: textstyle.bodySmall!.copyWith(color: Palette.black),),
            )
          ],
        ),
      ),
    );
  }
}