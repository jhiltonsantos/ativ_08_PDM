import 'package:flutter/material.dart';

class Question1 extends StatefulWidget {
  const Question1({Key? key}) : super(key: key);

  @override
  State<Question1> createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  List<bool> isSelected = List.generate(3, (_) => false);
  bool boldSelected = false;
  bool italicSelected = false;
  bool underlineSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questão 1'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Lorem Ipsum',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight:
                    boldSelected == true ? FontWeight.bold : FontWeight.normal,
                fontStyle: italicSelected == true
                    ? FontStyle.italic
                    : FontStyle.normal,
                decoration: underlineSelected == true
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            ),
          ),
          ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  isSelected[index] = !isSelected[index];
                  isSelected[0] == true
                      ? boldSelected = true
                      : boldSelected = false;
                  isSelected[1] == true
                      ? italicSelected = true
                      : italicSelected = false;
                  isSelected[2] == true
                      ? underlineSelected = true
                      : underlineSelected = false;
                });
              },
              isSelected: isSelected,
              children: const [
                Icon(Icons.format_bold),
                Icon(Icons.format_italic),
                Icon(Icons.format_underline),
              ]),
        ]),
      ),
    );
  }
}
