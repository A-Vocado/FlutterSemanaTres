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
  bool isCheckedBox = false;
  String selectedGenre = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(1, 25, 5, 25),
                      child: Text(
                        'Criar Conta',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Text('Identidade de Genêro'),
                    RadioListTile(
                        title: Text('Masculino'),
                        activeColor: Colors.red,
                        value: 'Masculino',
                        groupValue: selectedGenre,
                        onChanged: (String? valor) {
                          setState(() {
                            selectedGenre = valor!;
                          });
                        }),
                    RadioListTile(
                        title: Text('Feminino'),
                        activeColor: Colors.red,
                        value: 'Feminino',
                        groupValue: selectedGenre,
                        onChanged: (String? valor) {
                          setState(() {
                            selectedGenre = valor!;
                          });
                        }),
                    RadioListTile(
                        title: Text('Outro'),
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
                      padding: const EdgeInsets.all(15.0),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: 'Turma'),
                        validator: Validator.validateStatesDropdown,
                        items: ['Teste', 'NodeJS', 'QA']
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
                            CheckboxListTile(
                              title:
                                  Text('Eu li e aceito os termos do contrato'),
                              value: isCheckedBox,
                              onChanged: (value) {
                                setState(() {
                                  isCheckedBox = !isCheckedBox;
                                  state.didChange(value);
                                });
                              },
                              activeColor: Colors.blue[900],
                              checkColor: Colors.white,
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
                      onPressed: _registerBottom,
                      child: Text("Criar Conta"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[900]),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 20))),
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

  void _registerBottom() {
    if (formMasterKey.currentState!.validate()) {
      debugPrint('Cadastro realizado com sucesso');
      formMasterKey.currentState!.save();
    } else {
      debugPrint('Corrija os erros e tente novamente');
    }
  }
}
