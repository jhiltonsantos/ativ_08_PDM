import 'package:exercicio_8/exercicio/data/repositories/user_repository.dart';
import 'package:exercicio_8/exercicio/domain/entities/user.dart';
import 'package:flutter/material.dart';

import 'exercicio/presentation/pages/home_page.dart';

void main() async {
  UserRepository userRepository = UserRepository();
  List<User> users = await userRepository.findAllUser();
  print('NOME: ${users[1].name}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
