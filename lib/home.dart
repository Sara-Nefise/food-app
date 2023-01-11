import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/main.dart';
import 'package:foodapp/src/recipe_managment/presentation/screens/add_recipe.dart';
import 'package:foodapp/src/recipe_managment/presentation/screens/recipes_screen.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/screens/refigerator_screen.dart';
import 'package:foodapp/src/tips/presentation/screens/add_tip.dart';
import 'package:foodapp/src/tips/presentation/screens/storage_tips.dart';
import 'package:riverpod_context/riverpod_context.dart';

class AppNavigation extends StatelessWidget {
  AppNavigation({super.key});
  List<IconData> iconList = [
    Icons.food_bank_outlined,
    Icons.menu_book,
    Icons.tips_and_updates_outlined,
    Icons.account_box
  ];
  final autoSizeGroup = AutoSizeGroup();
  List<String> navigationText = [
    'Refrigerator',
    'Recipes',
    'Storage Tips',
    'My Profile',
    '',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: [
          RefigeratorScreen(),
          RecipesScreen(),
          StrorageTipsScreen(),
          Text('profile'),
          AddRecipeItemScreen(),
          AddTipItemScreen(),
        ],
        index: context.watch(currentIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.midGrey,
        child: Image.asset(
          'assets/images/big_plus.png',
        ),
        onPressed: () {
          context.read(currentIndex.notifier).state = 4;
        },
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          notchSmoothness: NotchSmoothness.sharpEdge,
          backgroundColor: AppColors.violaPurple,
          gapLocation: GapLocation.center,
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? AppColors.darkPurple : AppColors.milkWhite;
            return Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconList[index],
                    size: 30,
                    color: color,
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: AutoSizeText(
                      navigationText[index],
                      maxLines: 1,
                      style: TextStyle(color: color),
                      group: autoSizeGroup,
                    ),
                  )
                ],
              ),
            );
          },
          activeIndex: context.watch(currentIndex),
          onTap: (int index) {
            context.read(currentIndex.notifier).state = index;
          }),
    );
  }
}
