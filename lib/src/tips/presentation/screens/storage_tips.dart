import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/constants/app_constants.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/main.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bm_text.dart';
import 'package:foodapp/src/tips/data/firebase_tips_repository.dart';
import '../../../refrigerator_managment/presentation/components/category_items.dart';
import '../../../refrigerator_managment/presentation/widgets/cupertino_sreach.dart';
import '../../../refrigerator_managment/presentation/widgets/DL_text.dart';
import '../../../refrigerator_managment/presentation/widgets/bs_text.dart';
import '../../../refrigerator_managment/presentation/widgets/dm_text.dart';
import 'package:riverpod_context/riverpod_context.dart';

class StrorageTipsScreen extends ConsumerWidget {
  const StrorageTipsScreen({super.key});
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

    print('categoryIndex $categoryIndex');
    final tipsItem = context
        .watch(tipsRepositoryProvider)
        .getTipsItems(category: categories[categoryIndex]);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read(currentIndex.notifier).state = 6;
          },
          backgroundColor: AppColors.blackPearl,
          child: const Icon(Icons.tips_and_updates_outlined),
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
                          onPressed: () async {},
                          icon: Image.asset(
                            'assets/images/filter.png',
                          ))
                    ],
                  ),
                  context.emptyMeduimBox,
                  CategoryItemList(categories: categories),
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
                                  return Container(
                                    height: context.height * 0.14,
                                    margin: context.panddingBottomList,
                                    decoration: context.listTile,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 35, vertical: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BMText(
                                            text: data[index]['name'],
                                            color: AppColors.black,
                                          ),
                                          context.emptyVeryLowBox,
                                          Expanded(
                                              child: BSText(
                                                  text: data[index]['details']))
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        } else if (snapshot.hasError) {
                          // show an error message
                          return Text("Error: ${snapshot.error}");
                        } else {
                          // show a loading spinner
                          return CircularProgressIndicator();
                        }
                      })
                ],
              )),
        )));
  }
}
