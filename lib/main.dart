import 'package:flutter/material.dart';
import 'package:formy/birthday_field.dart';
import 'package:formy/email_field.dart';
import 'package:formy/validator.dart';
import 'cpf_field.dart';
import 'birthday_field.dart';

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
  bool isChecked = false;
  String selectedGenre = 'Masculino';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const Text(
                      'Identidade de Gênero',
                      textAlign: TextAlign.start,
                    ),
                    RadioListTile(
                        title: const Text('Masculino'),
                        activeColor: Colors.red,
                        value: 'Masculino',
                        groupValue: selectedGenre,
                        onChanged: (String? valor) {
                          setState(() {
                            selectedGenre = valor!;
                          });
                        }),
                    RadioListTile(
                        title: const Text('Feminino'),
                        activeColor: Colors.red,
                        value: 'Feminino',
                        groupValue: selectedGenre,
                        onChanged: (String? valor) {
                          setState(() {
                            selectedGenre = valor!;
                          });
                        }),
                    RadioListTile(
                        title: const Text('Outro'),
                        activeColor: Colors.red,
                        value: 'Outro',
                        groupValue: selectedGenre,
                        onChanged: (String? valor) {
                          setState(() {
                            selectedGenre = valor!;
                          });
                        }),
                    const EmailField(),
                    const CpfField(),
                    const BirthField(),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
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
                      initialValue: isChecked,
                      validator: Validator.validateCheckbox,
                      builder: (state) {
                        return Column(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = !isChecked;
                                  state.didChange(value);
                                });
                              },
                            ),
                            state.errorText == null
                                ? Container()
                                : const Text(
                                    'aceite o contrato, por favor',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                          ],
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: _register,
                      child: const Text("Cadastrar"),
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

  void _register() {
    if (formMasterKey.currentState!.validate()) {
      debugPrint('cadastro realizado com sucesso');
      formMasterKey.currentState!.save();
    } else {
      debugPrint('corrija os erros e tente novamente');
    }
  }
}
