import 'package:foodapp/src/refrigerator_managment/domain/refrigerator.dart';
import 'package:foodapp/src/tips/domain/tips.dart';

abstract class TipsRepository {
  Future<List<Tips>?> getRefigertorItems();
  Future<void> createTipsItem({required Tips item});
}
