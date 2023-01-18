import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/main.dart';
import 'package:foodapp/src/recipe_managment/data/firestorage_recipe_repository.dart';
import 'package:foodapp/src/recipe_managment/data/firestore_recipe_repository.dart';
import 'package:foodapp/src/recipe_managment/domain/recipe.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/components/validation_elevated_button.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../refrigerator_managment/presentation/components/category_items.dart';
import '../../../refrigerator_managment/presentation/widgets/custom_reactive_textfield.dart';
import 'package:riverpod_context/riverpod_context.dart';

class RecipeReactiveForm extends StatelessWidget {
  RecipeReactiveForm({
    Key? key,
    required this.recipeForm,
  }) : super(key: key);
  final FormGroup recipeForm;
  final List<String> categories = [
    'Pastries',
    'Grills',
    'Soups',
  ];

  String? imagepath;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: recipeForm,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CategoryItemList(
              categories: categories,
              form: recipeForm,
              cotrolName: 'category',
            ),
          ),
          context.emptyMeduimBox,
          Stack(
            children: [
              ReactiveFormConsumer(
                builder:
                    (BuildContext context, FormGroup formGroup, Widget? child) {
                  return CircleAvatar(
                    radius: 115,
                    backgroundColor: AppColors.midGrey,
                    backgroundImage: NetworkImage(imagepath ??
                        'https://food-guide.canada.ca/sites/default/files/styles/fgk_image_large/public/2022-02/Mapo%20Tofu%20with%20Chicken.jpg'),
                  );
                },
              ),
              Positioned(
                bottom: 16,
                right: 15,
                child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.midGrey,
                    child: IconButton(
                      onPressed: () async {
                        print('clicked');
                        await context
                            .read(firestorageRepositoryProvider)
                            .filePicker();
                        recipeForm.control('image').value = context
                            .read(firestorageRepositoryProvider)
                            .imagePath;
                        imagepath = recipeForm.control('image').value;
                      },
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
              'required': (error) => 'This field must not be empty',
            },
          ),
          context.emptyMeduimBox,
          CustomReactiveTextField(
            formController: 'ingredients',
            hint: 'Ingredients:',
            validation: {
              'required': (error) => 'This field must not be empty',
            },
          ),
          context.emptyMeduimBox,
          CustomReactiveTextField(
            formController: 'details',
            hint: 'Details ..',
            maxLine: 2,
            padding: context.paddingdetailField,
            validation: {
              'required': (error) => 'This field must not be empty',
            },
            textAction: TextInputAction.send,
          ),
          context.emptyMeduimBox,
          ReactiveFormConsumer(
            builder:
                (BuildContext context, FormGroup formGroup, Widget? child) {
              return ValidationButton(
                  text: 'Procced',
                  callback: formGroup.valid
                      ? () async {
                          print(
                              "Form is valid, the value is ${formGroup.value}");

                          final item = Recipe.fromJson(formGroup.value);
                          try {
                            await context
                                .read(recipeRepositoryProvider)
                                .createRecipeItem(item: item);
                            context.read(currentIndex.notifier).state = 1;
                          } catch (e) {}
                        }
                      : null);
            },
          )
        ],
      ),
    );
  }
}
