import 'package:flutter/material.dart';
import 'package:formy/email_field.dart';
import 'package:formy/validator.dart';
import 'input_field.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formMasterKey = GlobalKey<FormState>();
  bool isCheckedBox = false;
  String selectedGenre = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Raro Buddy'),
      ),
      body: Form(
        key: formMasterKey,
        child: LayoutBuilder(
          builder: (context, contraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: contraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const EmailField(),
                    InputField(
                      labelTxt: 'CPF',
                      hintTxt: '000.000.000-00',
                      validate: Validator.validateCPF,
                    ),
                    InputField(
                      labelTxt: 'Data de Nascimento',
                      hintTxt: 'dd/mmm/aaaa',
                      validate: Validator.validateBirth,
                    ),
                    const Text('Identidade de Genêro'),
                    RadioListTile(
                      title: const Text('Masculino'),
                      activeColor: Colors.red,
                      value: 'Masculino',
                      groupValue: selectedGenre,
                      onChanged: (String? valor) {
                        setState(
                          () {
                            selectedGenre = valor!;
                          },
                        );
                      },
                    ),
                    RadioListTile(
                      title: const Text('Feminino'),
                      activeColor: Colors.red,
                      value: 'Feminino',
                      groupValue: selectedGenre,
                      onChanged: (String? valor) {
                        setState(
                          () {
                            selectedGenre = valor!;
                          },
                        );
                      },
                    ),
                    RadioListTile(
                      title: const Text('Outro'),
                      activeColor: Colors.red,
                      value: 'Outro',
                      groupValue: selectedGenre,
                      onChanged: (String? valor) {
                        setState(() {
                          selectedGenre = valor!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: 'Turma'),
                        validator: Validator.validateStatesDropdown,
                        items: ['Flutter', 'NodeJS', 'QA']
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          debugPrint(value);
                        },
                      ),
                    ),
                    FormField<bool>(
                      initialValue: isCheckedBox,
                      validator: Validator.validateCheckbox,
                      builder: (state) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: isCheckedBox,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        isCheckedBox = !isCheckedBox;
                                        state.didChange(value);
                                      },
                                    );
                                  },
                                  activeColor: Colors.blue[900],
                                  checkColor: Colors.white,
                                ),
                              ),
                            ),
                            state.errorText == null
                                ? Container()
                                : const Text(
                                    'Aceite o contrato, por favor',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                          ],
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: _registerButton,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[900]),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(15)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 20))),
                      child: const Text("Criar Conta"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _registerButton() {
    if (formMasterKey.currentState!.validate()) {
      debugPrint('Cadastro realizado com sucesso');
      formMasterKey.currentState!.save();
    } else {
      debugPrint('Corrija os erros e tente novamente');
    }
  }
}
