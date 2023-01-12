import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/constants/app_constants.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/main.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bm_text.dart';
import '../../../../core/constants/app_string.dart';
import '../../../refrigerator_managment/presentation/components/category_items.dart';
import '../../../refrigerator_managment/presentation/components/cupertino_sreach.dart';
import '../../../refrigerator_managment/presentation/widgets/DL_text.dart';
import '../../../refrigerator_managment/presentation/widgets/bs_text.dart';
import '../../../refrigerator_managment/presentation/widgets/dm_text.dart';
import 'package:riverpod_context/riverpod_context.dart';

class StrorageTipsScreen extends StatelessWidget {
  AppConstants myString = AppConstants();
  List<String> categories = const [
    'Groceries',
    'Dairy products',
    'Meat products',
    'All',
    'Groceries',
    'Dairy products',
    'Meat products',
    'All'
  ];

  StrorageTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read(currentIndex.notifier).state = 5;
          },
          backgroundColor: AppColors.blackPearl,
          child: Icon(Icons.tips_and_updates_outlined),
        ),
        body: SafeArea(
          child: Container(
              width: double.infinity,
              decoration: context.imageDecoration,
              child: Padding(
                padding: context.pagePadding,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DLText(text: myString.logo),
                          Image.asset('assets/images/Vector.png')
                        ],
                      ),
                      context.emptyLowBox,
                      DMText(text: myString.storageTip),
                      context.emptyVeryLowBox,
                      BSText(text: myString.storageTipBody),
                      context.emptyMeduimBox,
                      Row(
                        children: [
                          const Expanded(child: CustomCupertinoSreach()),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/filter.png',
                              ))
                        ],
                      ),
                      context.emptyMeduimBox,
                      CategoryItemList(categories: categories),
                      context.emptyMeduimBox,
                      Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: tips.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: context.height * 0.14,
                                  margin: context.panddingBottomList,
                                  decoration: context.listTile,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 35, vertical: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BMText(
                                          text: tips[index].name,
                                          color: AppColors.black,
                                        ),
                                        context.emptyVeryLowBox,
                                        Expanded(
                                            child: BSText(
                                                text: tips[index].detail))
                                      ],
                                    ),
                                  ),
                                );
                              }))
                    ]),
              )),
        ));
  }
}
