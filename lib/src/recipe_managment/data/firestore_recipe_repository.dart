import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/src/recipe_managment/data/recipe_repository.dart';
import 'package:foodapp/src/recipe_managment/domain/recipe.dart';

final recipeRepositoryProvider = Provider<FirestoreRecipeRepository>(
  (ref) => FirestoreRecipeRepository(
      FirebaseFirestore.instance.collection('recipes')),
);
final recipeProvider = FutureProvider<List<Map<dynamic, dynamic>>>((ref) {
  return ref.read(recipeRepositoryProvider).getRecipeItems();
});

class FirestoreRecipeRepository extends RecipeRepository {
  FirestoreRecipeRepository(this.collection);
  final CollectionReference collection;

  @override
  Future<void> createRecipeItem({required Recipe item}) async {
    print('hey');

    BotToast.showLoading();
    try {
      await collection.add(item.toJson());
      BotToast.cleanAll();
      BotToast.showText(text: 'Done');
    } catch (e) {
      BotToast.cleanAll();
      BotToast.showText(text: 'Error happened');

      throw (e.toString());
    }
  }

  @override
  Future<List<Map<dynamic, dynamic>>> getRecipeItems({String? category}) async {
    try {
      if (category == 'All') {
        var querySnapshot = await collection.get();
        final allData =
            querySnapshot.docs.map((doc) => doc.data() as Map).toList();
        return allData;
      }

      final query = collection.where('category', isEqualTo: category);
      var querySnapshot = await query.get();

      final allData =
          querySnapshot.docs.map((doc) => doc.data() as Map).toList();
      return allData;
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  @override
  Future<List<Recipe>?> findItemByName({required String name}) {
    // TODO: implement findItemByName
    throw UnimplementedError();
  }
}
