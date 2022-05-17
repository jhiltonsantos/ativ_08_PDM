import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Question2 extends StatefulWidget {
  const Question2({Key? key}) : super(key: key);

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  late FocusNode focusNode1;
  late FocusNode focusNode2;
  late FocusNode focus;
  List<LogicalKeyboardKey> keys = [];
  int index = 0;
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focus = FocusNode();
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focus.dispose();
    keys = [];
    index = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: focus,
      onKey: (event) {
        final key = event.logicalKey;
        if (event is RawKeyDownEvent) {
          if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
            print('Enter');
          }

          setState(() => keys.add((key)));
        }

        if (keys.isNotEmpty) {
          if (keys[index].keyLabel == "Enter") {
            focusNode1.requestFocus();
          }
          if (keys[index].keyLabel == "Enter") {
            focusNode2.requestFocus();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Questão 2')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              autofocus: true,
              controller: text1,
            ),
            TextField(
              autofocus: true,
              focusNode: focusNode1,
              controller: text2,
            ),
            TextField(
              autofocus: true,
              focusNode: focusNode2,
              controller: text3,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (keys.isNotEmpty) {
              if (keys[index].keyLabel == "Enter") {
                focusNode1.requestFocus();
              }
              if (keys[index].keyLabel == "Enter") {
                focusNode2.requestFocus();
              }
            }
          },
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
