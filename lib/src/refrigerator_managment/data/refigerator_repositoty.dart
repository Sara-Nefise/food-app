import 'package:foodapp/src/refrigerator_managment/domain/refrigerator.dart';

abstract class RefigeratorRepository {
  Future<List<Map<dynamic, dynamic>>> getRefigertorItems({String? category});
  Future<void> createRefigertorItem({required Map<String, Object?> item});
  Future<void> updateRefigertorItem({required Refrigerator item});
  Future<void> deleteRefigertorItem({required String id});
  Future<List<Map<dynamic, dynamic>>> findItemByName({required String name});
}
