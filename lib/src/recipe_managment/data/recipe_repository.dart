import 'package:foodapp/src/recipe_managment/domain/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>?> getRecipeItems();
  Future<void> createRecipeItem({required Recipe item});
  Future<List<Recipe>?> findItemByName({required String name});
}
