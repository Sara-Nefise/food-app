// import 'package:flutter/material.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:foodapp/core/constants/app_constants.dart';
// import 'package:foodapp/core/constants/color/app_colors.dart';
// import 'package:foodapp/core/constants/extantion/app_extantion.dart';
// import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bm_text.dart';
// import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bs_text.dart';
// import 'package:foodapp/src/tips/data/firebase_tips_repository.dart';
// import 'package:foodapp/src/tips/domain/tips.dart';
// import '../../../../core/constants/app_string.dart';

// class testscreen extends ConsumerWidget {
//   AppConstants myString = AppConstants();
//   List<String> categories = const [
//     'Groceries',
//     'Dairy products',
//     'Meat products',
//     'All',
//     'Groceries',
//     'Dairy products',
//     'Meat products',
//     'All'
//   ];

//   testscreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final tipsItem = ref.watch(tipsRepositoryProvider).getTipsItems();

//     return Scaffold(
//         body: SafeArea(
//       child: FutureBuilder(
//         future: tipsItem,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) return Text('Error = ${snapshot.error}');

//           if (snapshot.hasData) {
//             List<Map>? data = snapshot.data;

//             return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: data!.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     height: context.height * 0.14,
//                     margin: context.panddingBottomList,
//                     decoration: context.listTile,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 35, vertical: 20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: BMText(
//                               text: data[index]['name'],
//                               color: AppColors.black,
//                             ),
//                           ),
//                           context.emptyVeryLowBox,
//                           Expanded(child: BSText(text: data[index]['details']))
//                         ],
//                       ),
//                     ),
//                   );
//                 });
//           }

//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//     ));
//   }
// }

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
