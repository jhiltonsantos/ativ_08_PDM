import 'dart:convert';

import 'package:exercicio_8/exercicio/data/web_client.dart';
import 'package:exercicio_8/exercicio/domain/entities/user.dart';
import 'package:exercicio_8/exercicio/domain/repositories/i_user_repository.dart';
import 'package:http/http.dart' as http;

class UserRepository implements IUserRepository {
  @override
  Future<List<User>> findAllUser() async {
    final http.Response response =
        await client.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar usuários');
    }
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<User> users =
        decodedJson.map((dynamic json) => User.fromJson(json)).toList();
    return users;
  }
}
