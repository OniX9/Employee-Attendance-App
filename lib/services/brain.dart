class Brain {
  authCheck(String? email, String? password){
    if (email != null && password != null) {
      bool isEmailContentValid =
      RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      bool isPasswordShort = password.length < 7;
      bool isPasswordCorrect = email == 'onisemem10@gmail.com';
      bool isEmailCorrect = password == 1234;

      if (!isEmailContentValid){
        return AuthInputError.emailInValid;
      } else if (!isPasswordShort){
        return AuthInputError.passwordShort;
      } else if (!isPasswordCorrect){
        return AuthInputError.passwordIncorrect;
      } else if (!isEmailCorrect) {
        return AuthInputError.emailIncorrect;
      }
    } else {
      return AuthInputError.emptyField;
    }
  }
}

enum AuthInputError {
  emptyField,
  emailInValid,
  passwordShort,
  emailIncorrect,
  passwordIncorrect,
}