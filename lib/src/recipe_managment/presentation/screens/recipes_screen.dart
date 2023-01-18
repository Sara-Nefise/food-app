import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/constants/app_constants.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/main.dart';
import 'package:foodapp/src/recipe_managment/data/firestore_recipe_repository.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bm_text.dart';
import 'package:riverpod_context/riverpod_context.dart';
import '../../../refrigerator_managment/presentation/components/category_items.dart';
import '../../../refrigerator_managment/presentation/widgets/cupertino_sreach.dart';
import '../../../refrigerator_managment/presentation/widgets/DL_text.dart';
import '../../../refrigerator_managment/presentation/widgets/bs_text.dart';
import '../../../refrigerator_managment/presentation/widgets/dm_text.dart';

class RecipesScreen extends ConsumerWidget {
  RecipesScreen({super.key});

  final AppConstants myString = AppConstants();

  final List<String> categories = const ['Pastries', 'Grills', 'Soups', 'All'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var categoryIndex = ref.watch(selectedIndex);

    print('categoryIndex $categoryIndex');
    final tipsItem = context
        .watch(recipeRepositoryProvider)
        .getRecipeItems(category: categories[categoryIndex]);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read(currentIndex.notifier).state = 4;
          },
          backgroundColor: AppColors.blackPearl,
          child: const Icon(Icons.tips_and_updates_outlined),
        ),
        body: Container(
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
                  FutureBuilder(
                      future: tipsItem,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          List<Map>? data = snapshot.data;
                          return Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                    margin: const EdgeInsets.only(bottom: 17),
                                    child: Padding(
                                      padding: const EdgeInsets.all(25),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          data[index]['image'] != ''
                                              ? Image.network(
                                                  data[index]['image'],
                                                  width: double.infinity,
                                                  height: 250,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  'assets/images/food.png',
                                                  width: double.infinity,
                                                  height: 250,
                                                  fit: BoxFit.cover,
                                                ),
                                          context.emptyLowBox,
                                          BMText(
                                              text: data[index]['name'],
                                              color: AppColors.black),
                                          context.emptyVeryLowBox,
                                          BSText(text: data[index]['details']),
                                        ],
                                      ),
                                    ));
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                          // show an error message
                          return Text("Error: ${snapshot.error}");
                        } else {
                          // show a loading spinner
                          return const CircularProgressIndicator();
                        }
                      })
                ],
              )),
        ));
  }
}
