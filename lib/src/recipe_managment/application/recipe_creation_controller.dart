import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/src/recipe_managment/application/firestore_recipe_repository.dart';
import 'package:foodapp/src/recipe_managment/data/firestore_recipe_repository.dart';
import 'package:foodapp/src/recipe_managment/domain/recipe.dart';
import 'package:reactive_forms/reactive_forms.dart';

final recipeCreationProvider =
    StateNotifierProvider((ref) => RecipeCreationController(ref));

class RecipeCreationController extends StateNotifier<FormGroup> {
  final Ref ref;

  FormGroup get form => state;
  RecipeCreationController(this.ref)
      : super(FormGroup({
          'name': FormControl<String>(
            validators: [Validators.required],
          ),
          // 'category': FormControl<String>(
          //   validators: [Validators.required],
          // ),
          'details': FormControl<String>(
            validators: [Validators.required],
          ),
          // 'image': FormControl<String>(),
          'ingredients': FormControl<String>(),
        }));

  void setName(String name) {
    // state = state.copyWith(name: name);
    print('set name worksss');
    form.control('name').value = name;
    state.control('name').value = form.control('name').value;
  }

  // void setCategory(String category) {
  //   form.control('category').value = category;

  //   // state.copyWith(category: form.control('category').value);
  // }

  void setDetails(String details) {
    print(details);

    form.control('details').value = details;
    state.control('details').value = form.control('details').value;
    // state.updateTouched();

    // state.copyWith(details: form.control('details').value);
  }

  // void setImage(String image) {
  //   form.control('image').value = image;

  //   // state.copyWith(image: form.control('image').value);
  // }

  void setIngredients(String ingredients) {
    form.control('ingredients').value = ingredients;
    state.control('ingredients').value = form.control('ingredients').value;

    // state.copyWith(ingredients: form.control('ingredients').value);
  }

  void submit() {
    if (form.valid) {
      print(state.valueChanges);

      print("Form is valid, the value is ${form.value}");
      final item = Recipe.fromJson(form.value);
      ref.read(firestorRecipeRepositoryProvider).createRecipeItem(item: item);
    } else {
      print("Form is invalid");
    }
  }
}
