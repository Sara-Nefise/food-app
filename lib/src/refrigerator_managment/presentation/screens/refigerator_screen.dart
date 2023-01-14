import 'package:flutter/material.dart';
import 'package:foodapp/core/constants/app_constants.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/category_items.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bs_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/cupertino_sreach.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/dl_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/dm_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/ds_text.dart';

import '../../../../core/constants/app_string.dart';

class RefigeratorScreen extends StatelessWidget {
  const RefigeratorScreen({super.key});

  final List<String> categories = const [
    'Groceries',
    'Dairy products',
    'Meat products',
    'All',
    'Groceries',
    'Dairy products',
    'Meat products',
    'All'
  ];

  @override
  Widget build(BuildContext context) {
    AppConstants myString = AppConstants();
    return Container(
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
              DMText(text: myString.myRefrigerator),
              context.emptyVeryLowBox,
              BSText(text: myString.listOfitems),
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
              context.emptyLowBox,
              CategoryItemList(categories: categories),
              context.emptyMeduimBox,
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: refrigeratorList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: context.height * 0.095,
                      margin: context.panddingBottomList,
                      decoration: context.listTile,
                      child: Padding(
                        padding: context.paddinglistTile,
                        child: Row(
                          children: [
                            Expanded(
                                child: CircleAvatar(
                              radius: 30,
                              backgroundColor: AppColors.violaPurple,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/images/edit.png',
                                  )),
                            )),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DSText(
                                        text: refrigeratorList[index].name,
                                      ),
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: AppColors.violaPurple,
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(
                                              'assets/images/edit.png',
                                            )),
                                      )
                                    ],
                                  )),
                                  const SizedBox(height: 3),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const DSText(text: '10 Days'),
                                      DSText(
                                        text:
                                            '${refrigeratorList[index].quantity.toString()}${refrigeratorList[index].unit}',
                                      ),
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: AppColors.redOrange,
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(
                                              'assets/images/trash.png',
                                            )),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
