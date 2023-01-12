import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/src/recipe_managment/data/firestore_recipe_repository.dart';

final firestorRecipeRepositoryProvider = Provider<FirestoreRecipeRepository>(
  (ref) => FirestoreRecipeRepository(
      FirebaseFirestore.instance.collection('recipes')),
);
