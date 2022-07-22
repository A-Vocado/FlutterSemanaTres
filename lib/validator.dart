class Validator {
  static String? validateEmail(String? value) {
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
