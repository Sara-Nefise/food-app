import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodapp/src/refrigerator_managment/data/refigerator_repositoty.dart';
import 'package:foodapp/src/refrigerator_managment/domain/refrigerator.dart';

class FirebaseRefigeratorRepository extends RefigeratorRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('refrigerator');
  @override
  Future<void> createRefigertorItem({required Refrigerator item}) async {
    await collection.add(item);
  }

  @override
  Future<void> deleteRefigertorItem({required String id}) async {
    await collection.doc(id).delete();
  }

  @override
  Future<List<Refrigerator>?> findItemByName({required String name}) {
    // TODO: implement findItemByName
    throw UnimplementedError();
  }

  @override
  Future<void> updateRefigertorItem({required Refrigerator item}) async {
    await collection.doc(item.id).update(item.toJson());
  }

  @override
  Future<List<Refrigerator>?> getRefigertorItems() async {
    final result = await collection.get();
    return result.docs
        .map((doc) => Refrigerator.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
