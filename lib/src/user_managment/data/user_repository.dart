import 'package:foodapp/src/user_managment/domain/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class UserRepository {
  Future<List<User>?> getUsers();
  Future<User> getUser({required String id});
  Future<void> createUser({required User user});
  Future<void> updateUser({required User user});
  Future<void> deleteUser({required String id});
  Future<List<User>?> findUserByName({required String name});
}
