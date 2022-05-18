import 'package:exercicio_8/exercicio/domain/entities/checkbox_state_model.dart';
import 'package:exercicio_8/exercicio/presentation/resources/strings.dart';
import 'package:flutter/material.dart';

class Question3 extends StatefulWidget {
  const Question3({Key? key}) : super(key: key);

  @override
  State<Question3> createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  final allPermissions = CheckBoxState(title: 'Permitir todos');

  final permissions = [
    CheckBoxState(title: 'Permitir acesso aos dados pesoais.'),
    CheckBoxState(title: 'Permitir acesso a localização.'),
    CheckBoxState(title: 'Permitir acesso a internet.'),
  ];

  bool isButtonEnable = false;
  dynamic tristateCheckbox = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Questão 3')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                'Lorem Ipsum',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                textAlign: TextAlign.left,
              ),
              Text(
                textPolitics,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20.0,
              ),
              buildCheckbox(permissions[0]),
              buildCheckbox(permissions[1]),
              buildCheckbox(permissions[2]),
              buildGroupCheckbox(allPermissions),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed:
                        isButtonEnable ? () => Navigator.pop(context) : null,
                    child: const Text('Continuar')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CheckboxListTile buildCheckbox(CheckBoxState checkbox) {
    return CheckboxListTile(
        title: Text(checkbox.title),
        value: checkbox.value,
        onChanged: (value) {
          setState(() {
            checkbox.value = value!;
            allPermissions.value =
                permissions.every((permission) => permission.value);

            changeButtonConfirmState();
            changeGroupCheckboxInderterminade();
          });
        });
  }

  CheckboxListTile buildGroupCheckbox(CheckBoxState checkbox) {
    return CheckboxListTile(
        title: Text(checkbox.title),
        value: checkbox.value,
        tristate: tristateCheckbox,
        onChanged: switchCheckbox);
  }

  void switchCheckbox(bool? value) {
    if (value == null) return;

    setState(() {
      allPermissions.value = value;
      for (var permision in permissions) {
        permision.value = value;
      }
      changeFalseCheckbox();
      changeButtonConfirmState();
    });
  }

  void changeGroupCheckboxInderterminade() {
    changeFalseCheckbox();
    if (allPermissions.value == false) {
      for (var permission in permissions) {
        if (permission.value) allPermissions.value = null;
      }
    }
  }

  void changeFalseCheckbox() {
    bool aux = true;
    if (allPermissions.value) {
      for (var permission in permissions) {
        if (permission.value == false) aux = false;
      }
      if (aux) tristateCheckbox = false;
    } else {
      tristateCheckbox = true;
    }
  }

  void changeButtonConfirmState() {
    allPermissions.value ? isButtonEnable = true : isButtonEnable = false;
  }
}
