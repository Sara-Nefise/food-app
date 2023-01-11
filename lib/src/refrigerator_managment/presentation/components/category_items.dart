import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bm_text.dart';

class CategoryItemList extends StatelessWidget {
  final List<String> categories;
  const CategoryItemList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.075,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.all(3),
              padding: context.paddingCategory,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.midGrey),
              child: Center(
                  child: BMText(
                color: AppColors.milkWhite,
                text: categories[index],
              )),
            ),
          );
        },
      ),
    );
  }
}
