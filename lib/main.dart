import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
//  //import 'package:formy/email_field.dart';
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
  bool isObscure = true;
  String selectedGenre = '';
  String password = '';
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 5, 25),
                      child: Text(
                        'Criar Conta',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: TextFormField(
                          onChanged: (passwordUser) {
                            password = passwordUser;
                          },
                          validator: Validator.validatePassword,
                          obscureText: isObscure,
                          obscuringCharacter: "*",
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              labelText: 'Senha',
                              hintText: 'Digite sua senha',
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    isObscure = !isObscure;
                                    setState(() {});
                                  },
                                  child: Icon(isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility)))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: TextFormField(
                          onChanged: (passwordUser) {
                            password = passwordUser;
                          },
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return 'o campo não pode ser vazio';
                            }
                            if (value != password) {
                              'As senhas não conferem';
                            }
                            return null;
                          }),
                          obscureText: isObscure,
                          obscuringCharacter: "*",
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              labelText: 'Confirmar Senha',
                              hintText: 'Digite sua senha',
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    isObscure = !isObscure;
                                    setState(() {});
                                  },
                                  child: Icon(isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility)))),
                    ),
                    InputField(
                      labelTxt: 'CPF',
                      hintTxt: '000.000.000-00',
                      validate: Validator.validateCPF,
                      keyboardNumbers: TextInputType.number,
                      maskFormatter: [CpfInputFormatter()],
                      icon: const Icon(Icons.badge),
                    ),
                    InputField(
                        labelTxt: 'Data de Nascimento',
                        hintTxt: 'dd/mmm/aaaa',
                        validate: Validator.validateBirth,
                        keyboardNumbers: TextInputType.number,
                        maskFormatter: [DataInputFormatter()],
                        icon: const Icon(Icons.cake)),
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
                              padding: const EdgeInsets.fromLTRB(50, 5, 5, 5),
                              child: Transform.scale(
                                scale: 1,
                                child: CheckboxListTile(
                                  title: Text(
                                    'Eu li e aceito os termos do contrato',
                                    style: TextStyle(fontSize: 12),
                                  ),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 20),
                      child: ElevatedButton(
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
