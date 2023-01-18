import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/main.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bm_text.dart';
import 'package:foodapp/src/tips/data/firebase_tips_repository.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_context/riverpod_context.dart';

class CategoryItemList extends StatelessWidget {
  final List<String> categories;
  CategoryItemList({
    super.key,
    required this.categories,
    this.form,
    this.cotrolName,
  });
  final FormGroup? form;
  final String? cotrolName;

  @override
  Widget build(BuildContext context) {
    if (form != null && cotrolName != null) {
      form?.control(cotrolName!).value = categories[0];
    }
    return SizedBox(
      height: context.height * 0.066,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return GestureDetector(
                onTap: (() {
                  ref.read(selectedIndex.notifier).state = index;
                  if (form != null && cotrolName != null) {
                    form?.control(cotrolName!).value = categories[index];
                  }

                  print(context.read(selectedIndex.notifier).state);
                }),
                child: Container(
                  margin: const EdgeInsets.all(3),
                  padding: context.paddingCategory,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: ref.watch(selectedIndex) == index
                          ? AppColors.midGrey
                          : AppColors.milkWhite),
                  child: Center(
                      child: BMText(
                    color: ref.watch(selectedIndex) != index
                        ? AppColors.midGrey
                        : AppColors.milkWhite,
                    text: categories[index],
                  )),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
