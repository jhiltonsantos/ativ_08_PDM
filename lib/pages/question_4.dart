import 'package:flutter/material.dart';

class Question4 extends StatefulWidget {
  const Question4({Key? key}) : super(key: key);

  @override
  State<Question4> createState() => _Question4State();
}

class _Question4State extends State<Question4> {
  bool lampValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Questão 4')),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              lampValue
                  ? 'assets/images/lamp_on.png'
                  : 'assets/images/lamp_off.png',
              height: 200,
            ),
          ),
          Switch.adaptive(
            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.black26,
            activeColor: Colors.amber,
            activeTrackColor: Colors.yellow,
            value: lampValue,
            onChanged: (value) {
              setState(() {
                lampValue = value;
              });
            },
          )
        ],
      )),
    );
  }
}
