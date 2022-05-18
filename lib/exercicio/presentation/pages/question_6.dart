import 'package:flutter/material.dart';

class Question6 extends StatefulWidget {
  const Question6({Key? key}) : super(key: key);

  @override
  State<Question6> createState() => _Question6State();
}

class _Question6State extends State<Question6> {
  List<String> elements = ['Hilton', 'Santos', 'Silva', 'Maria', 'Fernanda'];

  List<String> filter = [];

  @override
  void dispose() {
    super.dispose();
    filter = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Questão 6')),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return elements.where((String e) =>
                      e.contains(textEditingValue.text.toLowerCase()));
                },
                onSelected: (String onSelected) {
                  filter = elements;
                  elements = [];
                  elements.add(onSelected);
                  debugPrint('Selection $onSelected');
                  setState(() {});
                },
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: elements.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(elements[index]),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (filter.isNotEmpty) {
              elements = filter;
            }
          });
        },
        child: const Icon(Icons.list),
      ),
    );
  }
}
