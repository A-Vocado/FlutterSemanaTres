class Validator {
  static String? validateName(String? value) {
    final rfc5322 = RegExp(r'(^[a-zA-Z ]*[A-Z][a-z]* [A-Z][a-z])');

    if (value == null || value.isEmpty) {
      return 'o campo não pode ser vazio';
    }
    if (!value.contains(rfc5322)) {
      return 'nome inválido, digite seu nome corretamente';
    }
  }

  static String? validateEmail(String? value) {
    final upperCase = RegExp(r'[A-Z]');

    final rfc5322 = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])+");

    if (value == null || value.isEmpty) {
      return 'o campo não pode ser vazio';
    }

    if (value.contains(' ')) {
      return 'o campo não pode conter espaços';
    }
    if (!value.contains(rfc5322)) {
      return 'email inválido, digite um email corretamente';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'o campo não pode ser vazio';
    }
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~_]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'a senha não é considerada uma senha forte';
    }
  }

  static String? validateCheckbox(bool? value) {
    if (value != null && !value) {
      return 'aceite o contrato, por favor';
    }
    return null;
  }

  static String? validateStatesDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return "selecione um estado";
    }
    return null;
  }

  static String? validateCPF(String? value) {
    final standardCpf = RegExp(
        r"(?!(\d)\1{2}.\1{3}.\1{3}-\1{2})\d{3}\.\d{3}\.\d{3}\-\d{2}"); //padrão 000.000.000-00

    //RN01
    if (value == null || value.isEmpty) {
      return 'O campo não pode ser vazio';
    }

    //RN03
    if (value.contains(' ')) {
      return 'O campo não pode conter espaços';
    }

    //RN02
    if (!value.contains(standardCpf)) {
      return 'Formato inválido, por favor utilize o formato 000.000.000-00';
    }
    return null;
  }

  static String? validateBirth(String? value) {
    final dateFormat = RegExp(
        r"((0[1-9])|([1-2][0-9])|(3[0-1]))[/](([0][1-9])|([0][1-9])|(1[0-2]))[/]((19[2-9][0-9])|(20[0-9][0-9]))");

    //RN01
    if (value == null || value.isEmpty) {
      return 'O campo não pode ser vazio';
    }

    //RN02, RN03, RN04, RN05
    if (!value.contains(dateFormat)) {
      return 'Formato de data inválido, digite no formato dd/mm/aaaa';
    }
    return null;
  }
}
