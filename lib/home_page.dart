import 'package:exercicio_8/pages/question_1.dart';
import 'package:exercicio_8/pages/question_2.dart';
import 'package:exercicio_8/pages/question_3.dart';
import 'package:exercicio_8/pages/question_4.dart';
import 'package:exercicio_8/pages/question_5.dart';
import 'package:exercicio_8/pages/question_6.dart';
import 'package:exercicio_8/pages/question_7.dart';
import 'package:exercicio_8/resources/widgets/build_button_pages_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Exercício 8'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    BuildButtonPages(route: Question1(), text: 'Questão 1'),
                    BuildButtonPages(route: Question2(), text: 'Questão 2'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    BuildButtonPages(route: Question3(), text: 'Questão 3'),
                    BuildButtonPages(route: Question4(), text: 'Questão 4')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    BuildButtonPages(route: Question5(), text: 'Questão 5'),
                    BuildButtonPages(route: Question6(), text: 'Questão 6')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    BuildButtonPages(route: Question7(), text: 'Questão 7')
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
