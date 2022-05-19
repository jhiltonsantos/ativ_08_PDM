import 'package:exercicio_8/exercicio/data/repositories/user_repository.dart';
import 'package:exercicio_8/exercicio/domain/entities/user.dart';
import 'package:flutter/material.dart';

class Question7 extends StatefulWidget {
  const Question7({Key? key}) : super(key: key);

  @override
  State<Question7> createState() => _Question7State();
}

class _Question7State extends State<Question7> {
  final UserRepository userRepository = UserRepository();
  List<User> allUsers = [];
  List<String> names = [];

  String? selectedItem = 'Names';

  callme() async {
    await fetch().then((value) => {
          setState(() {
            allUsers = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    callme();

    for (User user in allUsers) {
      names.add(user.name!);
    }
    print('Nomes: $names');
    print('List $allUsers');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Questão 7')),
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FutureBuilder(
                future: userRepository.findAllUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Erro na requisição'),
                    );
                  }
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: allUsers.length,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(allUsers[index].name!),
                                  )
                                ],
                              );
                            })),
                      ],
                    );
                  } else {
                    return const Center(
                        child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(),
                    ));
                  }
                },
              ),
            ],
          )),
    );
  }

  Future<List<User>> fetch() async {
    return await userRepository.findAllUser();
  }
}
