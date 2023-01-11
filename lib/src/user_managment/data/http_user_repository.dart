import 'package:dio/dio.dart';
import 'package:foodapp/src/user_managment/data/user_repository.dart';
import 'package:foodapp/src/user_managment/domain/user.dart';

class HttpUserRepository implements UserRepository {
  final Dio client;

  HttpUserRepository(this.client);

  @override
  Future<void> createUser({required User user}) async {
    await client.post("/users/create", data: user.toJson());
  }

  @override
  Future<Response> deleteUser({required String id}) async {
    return await client.delete("/users/$id");
  }

  @override
  Future<List<User>?> findUserByName({required String name}) {
    // TODO: implement findUserByName
    throw UnimplementedError();
  }

  @override
  Future<User> getUser({required String id}) async {
    final response = await client.get<Map<String, dynamic>>("/users/$id");
    if (response.statusCode == 404 || response.data == null) {
      throw Exception("user not found");
    }
    return User.fromJson(response.data!);
  }

  @override
  Future<List<User>?> getUsers() async {
    final response = await client.get<List<dynamic>>("/users");
    if (response.statusCode == 404 || response.data == null) {
      throw Exception("user not found");
    }
    List<User>? users = response.data
        ?.map((userDoc) => User.fromJson(userDoc as Map<String, dynamic>))
        .toList();
    return users;
  }

  @override
  Future<void> updateUser({required User user}) async {
    await client.put("/users/${user.id}", data: user.toJson());
  }
}
