import 'package:exercicio_8/exercicio/data/repositories/user_repository.dart';
import 'package:exercicio_8/exercicio/domain/entities/user.dart';
import 'package:exercicio_8/exercicio/domain/repositories/i_user_repository.dart';

class FindAllUsers {
  final IUserRepository _iUserRepository = UserRepository();

  Future<List<User>> execute() {
    return _iUserRepository.findAllUser();
  }
}
