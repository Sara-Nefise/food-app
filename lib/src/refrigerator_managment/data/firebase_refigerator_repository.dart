import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/src/refrigerator_managment/data/refigerator_repositoty.dart';
import 'package:foodapp/src/refrigerator_managment/domain/refrigerator.dart';
import 'package:reactive_forms/reactive_forms.dart';

final refigertorRepositoryProvider = Provider<FirebaseRefigeratorRepository>(
  (ref) => FirebaseRefigeratorRepository(
      FirebaseFirestore.instance.collection('refrigerator')),
);

final refigertorProvider = FutureProvider<List<Map<dynamic, dynamic>>>((ref) {
  return ref.read(refigertorRepositoryProvider).getRefigertorItems();
});

class FirebaseRefigeratorRepository extends RefigeratorRepository {
  final CollectionReference collection;

  FirebaseRefigeratorRepository(this.collection);
  @override
  Future<void> createRefigertorItem(
      {required Map<String, Object?> item}) async {
    print('createRefigertorItem');
    BotToast.showLoading();
    try {
      await collection.add(item);
      BotToast.cleanAll();
      BotToast.showText(text: 'Done');
    } catch (e) {
      BotToast.cleanAll();
      BotToast.showText(text: 'Error happened');

      throw (e.toString());
    }
  }

  @override
  Future<void> deleteRefigertorItem({required String id}) async {
    await collection.doc(id).delete();
  }

  @override
  Future<List<Map<dynamic, dynamic>>> findItemByName({required String name}) {
    // TODO: implement findItemByName
    throw UnimplementedError();
  }

  @override
  Future<void> updateRefigertorItem({required Refrigerator item}) async {
    // await collection.doc(item.id).update(item.toJson());
  }

  @override
  Future<List<Map<dynamic, dynamic>>> getRefigertorItems(
      {String? category}) async {
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
}
