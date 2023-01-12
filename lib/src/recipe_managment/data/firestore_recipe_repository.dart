import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/src/recipe_managment/data/recipe_repository.dart';
import 'package:foodapp/src/recipe_managment/domain/recipe.dart';
import 'package:foodapp/src/refrigerator_managment/domain/refrigerator.dart';
import 'package:foodapp/src/tips/data/firebase_tips_repository.dart';

class FirestoreRecipeRepository extends RecipeRepository {
  FirestoreRecipeRepository(this.collection);
  final CollectionReference collection;

  @override
  Future<void> createRecipeItem({required Recipe item}) async {
    print('hey');
    try {
      var data = await collection.add(item.toJson());
    } on FirebaseException catch (e) {
      throw (e.toString());
    }

    // print(data);
  }

  @override
  Future<List<Recipe>?> getRecipeItems() async {
    final result = await collection.get();
    return result.docs
        .map((doc) => Recipe.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<Recipe>?> findItemByName({required String name}) {
    // TODO: implement findItemByName
    throw UnimplementedError();
  }
}
