import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/constants/app_constants.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/main.dart';
import 'package:foodapp/src/recipe_managment/data/firestore_recipe_repository.dart';
import 'package:foodapp/src/refrigerator_managment/data/firebase_refigerator_repository.dart';
import 'package:foodapp/src/refrigerator_managment/domain/refrigerator.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/category_items.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bs_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/cupertino_sreach.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/dl_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/dm_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/ds_text.dart';
import 'package:riverpod_context/riverpod_context.dart';

import '../../../../core/constants/app_string.dart';

class RefigeratorScreen extends ConsumerWidget {
  const RefigeratorScreen({super.key});

  final List<String> categories = const [
    'Groceries',
    'Dairy products',
    'Meat products',
    'All',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppConstants myString = AppConstants();
    var categoryIndex = ref.watch(selectedIndex);
    final refrigeratorItem = context
        .watch(refigertorRepositoryProvider)
        .getRefigertorItems(category: categories[categoryIndex]);
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
              FutureBuilder(
                future: refrigeratorItem,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    List<Map>? data = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data!.length,
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
                                    radius: 25,
                                    backgroundColor: AppColors.milkWhite,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/images/fork.png',
                                        )),
                                  )),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            DSText(text: data[index]['name']),
                                            CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  AppColors.violaPurple,
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                      'assets/images/edit.png')),
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
                                                  '${data[index]['quantity']}${data[index]['unit'].toString()}',
                                            ),
                                            CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  AppColors.redOrange,
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
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )
            ],
          ),
        ));
  }
}
