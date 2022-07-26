class Validator {
  //TODO: criar método para validar nome 
  //TODO: criar método para validar senha
  //TODO: criar método para validar CPF
  //TODO: criar método para validar data de nascimento
  //TODO: criar método para validar identidade de gênero
  //TODO: criar método para validar turma
  //TODO: criar método para validar aceite de termos

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

  static String? validateNome(String? value) {

    final rfc5322 = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])+");

    if (value == null || value.isEmpty) {
      return 'o campo não pode ser vazio';
    }

    if (!value.contains(rfc5322)) {
      return 'nome inválido, digite seu nome corretamente';
    }
    return null;
  }

  static String? validateSenha(String? value) {
    
    if (value == null || value.isEmpty) {
      return 'o campo não pode ser vazio';
    }

    
    return null;
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
}
