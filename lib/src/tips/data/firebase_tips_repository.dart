import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapp/src/tips/data/tips_repository.dart';
import 'package:foodapp/src/tips/domain/tips.dart';

final tipsRepositoryProvider = Provider((ref) => FirebaseTipsRepository());
final tipsProvider = FutureProvider<List<Map<dynamic, dynamic>>>((ref) {
  return ref.read(tipsRepositoryProvider).getTipsItems();
});

class FirebaseTipsRepository extends TipsRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('tips');

  @override
  Future<void> createTipsItem({required Map<String, Object?> item}) async {
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
  Future<List<Map<dynamic, dynamic>>> getTipsItems({String? category}) async {
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
