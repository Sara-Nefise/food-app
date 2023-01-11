import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodapp/src/tips/data/tips_repository.dart';
import 'package:foodapp/src/tips/domain/tips.dart';

class FirebaseTipsRepository extends TipsRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('tips');

  @override
  Future<void> createTipsItem({required Tips item}) {
    // TODO: implement createTipsItem
    throw UnimplementedError();
  }

  @override
  Future<List<Tips>?> getRefigertorItems() {
    // TODO: implement getRefigertorItems
    throw UnimplementedError();
  }
}
