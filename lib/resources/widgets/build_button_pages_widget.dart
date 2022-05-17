import 'package:flutter/material.dart';

class BuildButtonPages extends StatelessWidget {
  final String text;
  final dynamic route;
  const BuildButtonPages({Key? key, required this.route, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => route)));
        },
        child: Text(text));
  }
}
