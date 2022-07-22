import 'package:flutter/material.dart';
import 'package:formy/validator.dart';

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
                  validator: Validator.validateEmail,
                  onSaved: (value) {
                    debugPrint('enviando dados para api');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: DropdownButtonFormField<String>(
                  validator: Validator.validateStatesDropdown,
                  //o mais importante de tudo é isso aqui ó
                  items: ['Centro', 'Norte', 'Nordeste', 'Sul', 'Sudeste']
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
}
