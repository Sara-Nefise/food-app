import 'package:flutter/material.dart';
import 'package:foodapp/core/constants/app_constants.dart';
import 'package:foodapp/core/constants/app_string.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/main.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bm_text.dart';
import 'package:riverpod_context/riverpod_context.dart';
import '../../../refrigerator_managment/presentation/components/category_items.dart';
import '../../../refrigerator_managment/presentation/components/cupertino_sreach.dart';
import '../../../refrigerator_managment/presentation/widgets/DL_text.dart';
import '../../../refrigerator_managment/presentation/widgets/bs_text.dart';
import '../../../refrigerator_managment/presentation/widgets/dm_text.dart';

class RecipesScreen extends StatelessWidget {
  RecipesScreen({super.key});

  final AppConstants myString = AppConstants();

  final List<String> categories = const ['Pastries', 'Grills', 'Soups', 'All'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(currentIndex.notifier).state = 4;
        },
        backgroundColor: AppColors.blackPearl,
        child: Icon(Icons.tips_and_updates_outlined),
      ),
      body: Container(
          width: double.infinity,
          decoration: context.imageDecoration,
          child: Padding(
              padding: context.pagePadding,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DLText(text: myString.logo),
                    Image.asset('assets/images/Vector.png')
                  ],
                ),
                context.emptyLowBox,
                DMText(text: myString.recipe),
                context.emptyVeryLowBox,
                BSText(text: myString.recipebody),
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
                Align(
                  alignment: Alignment.topLeft,
                  child: CategoryItemList(categories: categories),
                ),
                context.emptyMeduimBox,
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: recipes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: context.height * 0.45,
                        margin: context.panddingBottomList,
                        decoration: context.listTile,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/images/food.png',
                                ),
                              ),
                              context.emptyLowBox,
                              BMText(
                                  text: recipes[index].name,
                                  color: AppColors.black),
                              context.emptyVeryLowBox,
                              BSText(text: recipes[index].details),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]))),
    );
  }
}
