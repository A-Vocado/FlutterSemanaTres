import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formMasterKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextFormField(
                  validator: _validateEmail,
                  onSaved: (value) {
                    debugPrint('enviando dados para api');
                  },
                ),
              ),
              FormField<bool>(
                initialValue: isChecked,
                validator: (value) {
                  if (value != null && !value) {
                    return 'aceite o contrato, por favor';
                  }
                  return null;
                },
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

                      //Sugestão do Dev Zorek
                      // isChecked
                      //     ? Container()
                      //     : const Text(
                      //         'aceite o contrato, por favor',
                      //         style: TextStyle(
                      //           color: Colors.red,
                      //         ),
                      //       ),
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

  String? _validateEmail(String? value) {
    final upperCase = RegExp(r'[A-Z]');
    final rfc5322 = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])+");

    if (value == null || value.isEmpty) {
      return 'o campo não pode ser vazio';
    }
    //Verificação com hasMatch
    // if (upperCase.hasMatch(value)) {
    //   return 'o campo não pode ter letras maiúsculas';
    // }

    if (value.contains(upperCase)) {
      return 'o campo não pode ter letras maiúsculas';
    }

    if (value.contains(' ')) {
      return 'o campo não pode conter espaços';
    }
    if (!value.contains(rfc5322)) {
      return 'email inválido, digite um email corretamente';
    }
    return null;
  }
}
