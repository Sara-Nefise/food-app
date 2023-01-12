import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/src/tips/data/tips_repository.dart';
import 'package:foodapp/src/tips/domain/tips.dart';

final itemRepositoryProvider = Provider((ref) => FirebaseTipsRepository());

class FirebaseTipsRepository extends TipsRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('tips');

  @override
  Future<void> createTipsItem({required Tips item}) {
    // TODO: implement createTipsItem
    throw UnimplementedError();
  }

  // @override
  // Future<List<Tips>?> getRefigertorItems() async {
  //   QuerySnapshot querySnapshot = await collection.get();
  //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //   return allData;
  // }

  @override
  Future<void> getRefigertorItems() async {
    QuerySnapshot querySnapshot = await collection.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData);
  }
}
