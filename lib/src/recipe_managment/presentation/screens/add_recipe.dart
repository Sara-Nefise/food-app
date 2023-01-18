import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/core/constants/app_constants.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/src/recipe_managment/application/recipe_form_controller.dart';
import 'package:foodapp/src/recipe_managment/presentation/components/recipe_reactive_form.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/category_items.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/custom_reactive_textfield.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/validation_elevated_button.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/DL_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bs_text.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/dm_text.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddRecipeItemScreen extends ConsumerWidget {
  AddRecipeItemScreen({super.key});

  final AppConstants myString = AppConstants();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FormGroup recipeForm = ref.watch(recipeFormProvider(0));
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
                    Padding(
                        padding: context.pagePadding,
                        child: RecipeReactiveForm(recipeForm: recipeForm)),
                    context.emptyMeduimBox,
                  ]),
                ]),
              )),
        ),
      ),
    );
  }
}
