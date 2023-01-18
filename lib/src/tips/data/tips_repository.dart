import 'package:foodapp/src/refrigerator_managment/domain/refrigerator.dart';
import 'package:foodapp/src/tips/domain/tips.dart';

abstract class TipsRepository {
  Future<void> createTipsItem({required Map<String, Object?> item});
  Future<List<Map<dynamic, dynamic>>> getTipsItems({String? category});
}
