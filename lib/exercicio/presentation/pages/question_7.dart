import 'package:exercicio_8/exercicio/domain/entities/user.dart';
import 'package:exercicio_8/exercicio/domain/usecases/user/queries/find_all_users.dart';
import 'package:flutter/material.dart';

class Question7 extends StatefulWidget {
  const Question7({Key? key}) : super(key: key);

  @override
  State<Question7> createState() => _Question7State();
}

class _Question7State extends State<Question7> {
  final FindAllUsers findAllUsers = FindAllUsers();

  List<User> allUsers = [];
  List<String> names = [];
  List<User> bkUsers = [];
  String selectedItem = "Nome";

  @override
  void initState() {
    super.initState();
    fetchToList();
  }

  @override
  Widget build(BuildContext context) {
    getNames();
    return Scaffold(
      appBar: AppBar(title: const Text('Questão 7')),
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 10.0),
                child: FutureBuilder(
                  future: findAllUsers.execute(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Erro na requisição'),
                      );
                    }
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          DropdownButton(
                            items: names
                                .map((String item) => DropdownMenuItem(
                                    value: item, child: Text(item)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value as String;
                                allUsers = getuser(selectedItem);
                              });
                            },
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: allUsers.length,
                              itemBuilder: ((context, index) => Column(
                                    children: [
                                      ListTile(
                                        title: Text(allUsers[index].name!),
                                      )
                                    ],
                                  ))),
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
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => fetchToList());
        },
        child: const Icon(Icons.list),
      ),
    );
  }

  void fetchToList() async {
    await findAllUsers
        .execute()
        .then((value) => {setState(() => allUsers = value)});
    bkUsers = allUsers;
  }

  void getNames() {
    if (names.isEmpty) {
      for (User user in allUsers) {
        names.add(user.name!);
      }
    }
  }

  void recoverList() async {
    if (allUsers.length == 1) {
      allUsers = [];
      allUsers = await findAllUsers.execute();
    }
  }

  List<User> getuser(String valueName) {
    if (names.isNotEmpty) {
      for (User user in bkUsers) {
        if (user.name == valueName) return [user];
      }
    }
    return [];
  }
}
