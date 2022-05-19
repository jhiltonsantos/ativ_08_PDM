import 'package:exercicio_8/exercicio/domain/entities/user.dart';

abstract class IUserRepository {
  Future<List<User>> findAllUser();
}
