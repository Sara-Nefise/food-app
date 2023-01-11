import 'package:foodapp/src/refrigerator_managment/domain/refrigerator.dart';

abstract class RefigeratorRepository {
  Future<List<Refrigerator>?> getRefigertorItems();
  Future<void> createRefigertorItem({required Refrigerator item});
  Future<void> updateRefigertorItem({required Refrigerator item});
  Future<void> deleteRefigertorItem({required String id});
  Future<List<Refrigerator>?> findItemByName({required String name});
}
