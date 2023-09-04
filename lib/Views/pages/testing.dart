// import 'package:flutter/material.dart';
// import 'package:wearther_app/Views/widgets/silver_appbar.dart';
// import 'package:wearther_app/const/style/color_pallete.dart';
// import 'package:wearther_app/const/style/size_config.dart';

// class TESTING extends StatelessWidget {
//   const TESTING({super.key});
  

//   @override
//   Widget build(BuildContext context) {
//     final textstyle = Theme.of(context).textTheme;
//     SizeConfig().init(context);

    
//     return Scaffold(
//       backgroundColor: Palette.appbackground,
//       body: CustomScrollView(
//                 slivers: [
//                   SliverPersistentHeader(delegate: SliverSearchAppBar(textstyle: textstyle),pinned: true,),
//                   SliverList(
//               delegate:
//                   SliverChildBuilderDelegate((BuildContext context, int index) {
//             return Container(
//                 margin: const EdgeInsets.all(8),
//                 padding: const EdgeInsets.all(16),
//                 child: const Text(
//                   'Cruelty-free brand',
//                   style: TextStyle(fontSize: 20,color: Colors.black),
//                 ));
//           }, childCount: 20))
//                 ],
//               ),
//     );
//   }
// }