import 'package:exercicio_8/exercicio/domain/entities/user.dart';
import 'package:exercicio_8/exercicio/domain/repositories/i_user_repository.dart';

class FindAllUsers {
  final IUserRepository userRepository;

  FindAllUsers(this.userRepository);

  Future<List<User>> execute() {
    return userRepository.findAllUser();
  }
}
