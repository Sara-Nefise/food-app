// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/constants/app_constants.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/src/recipe_managment/application/recipe_creation_controller.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/category_items.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/custom_reactive_textfield.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/validation_elevated_button.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/DL_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bs_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/dm_text.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_context/riverpod_context.dart';

class AddRecipeItemScreen extends ConsumerWidget {
  AddRecipeItemScreen({super.key});

  AppConstants myString = AppConstants();
  final List<String> categories = ['Pastries', 'Grills', 'Soups', 'All'];

  @override
  Widget build(BuildContext context, var watch) {
    final formStateNotifier = context
        .watch<RecipeCreationController>(recipeCreationProvider.notifier);
    return ProviderScope(
      child: Scaffold(
        body: SafeArea(
          child: Container(
              width: double.infinity,
              decoration: context.imageDecoration,
              child: Padding(
                padding: context.pagePadding,
                child: ListView(children: [
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DLText(text: myString.logo),
                        Image.asset('assets/images/Vector.png')
                      ],
                    ),
                    context.emptyLowBox,
                    DMText(text: myString.addRecipe),
                    context.emptyVeryLowBox,
                    BSText(text: myString.newItembody),
                    context.emptyMeduimBox,
                    context.emptyLowBox,
                    Align(
                      alignment: Alignment.topLeft,
                      child: CategoryItemList(categories: categories),
                    ),
                    context.emptyMeduimBox,
                    Padding(
                        padding: context.pagePadding,
                        child: newItemForm(context, formStateNotifier)),
                    context.emptyMeduimBox,
                  ]),
                ]),
              )),
        ),
      ),
    );
  }

  ReactiveForm newItemForm(
      BuildContext context, RecipeCreationController formStateNotifier) {
    return ReactiveForm(
      formGroup: formStateNotifier.form,
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                  radius: 115,
                  backgroundImage: AssetImage('assets/images/food.png')),
              Positioned(
                bottom: 16,
                right: 15,
                child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.midGrey,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.milkWhite,
                      ),
                    )),
              ),
            ],
          ),
          context.emptyMeduimBox,
          CustomReactiveTextField(
              formController: 'name',
              hint: 'Name',
              validation: {
                'required': (error) => 'The name must not be empty',
              },
              onchange: (control) {
                formStateNotifier.setName(control.value.toString());
              }),
          context.emptyMeduimBox,
          CustomReactiveTextField(
            formController: 'ingredients',
            hint: 'Ingredients:',
            validation: {'required': (error) => 'The market must not be empty'},
            onchange: (control) {
              formStateNotifier.setIngredients(control.value.toString());
            },
          ),
          context.emptyMeduimBox,
          CustomReactiveTextField(
            formController: 'details',
            hint: 'Details ..',
            maxLine: 2,
            padding: context.paddingdetailField,
            validation: {'required': (error) => 'The notes must not be empty'},
            onchange: (control) {
              formStateNotifier.setDetails(control.value.toString());
              print('detail tamam');
            },
            textAction: TextInputAction.send,
          ),
          context.emptyMeduimBox,
          ValidationButton(text: 'Procced', callback: formStateNotifier.submit)
        ],
      ),
    );
  }
}
