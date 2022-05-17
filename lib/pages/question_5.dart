import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class Question5 extends StatefulWidget {
  const Question5({Key? key}) : super(key: key);

  @override
  State<Question5> createState() => _Question5State();
}

class _Question5State extends State<Question5> {
  late TransformationController controller;
  double valueZoom = 1.0;

  double scale = 1.0;
  double previousScale = 1.0;

  @override
  void initState() {
    super.initState();
    controller = TransformationController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Questão 5')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onScaleStart: (ScaleStartDetails details) {
                previousScale = scale;
                setState(() {});
              },
              onScaleUpdate: (ScaleUpdateDetails scaleUpdateDetails) {
                scale = previousScale * scaleUpdateDetails.scale;
                setState(() {});
              },
              onScaleEnd: (ScaleEndDetails scaleEndDetails) {
                previousScale = 1.0;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
                child: Transform.scale(
                  scale: valueZoom,
                  child: Image.asset(
                    'assets/images/lamp_on.png',
                    height: 180,
                  ),
                ),
              ),
            ),
            Slider(
                value: valueZoom,
                min: 0.5,
                max: 2.0,
                onChanged: (double value) {
                  setState(() {
                    valueZoom = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
