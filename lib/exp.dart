class Exp{
  static bool isEmailValid(String email) {
    RegExp emailRegExp = RegExp(r'^[A-Za-z0-9]+@[A-Za-z0-9]+\.[a-z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    RegExp passwordRegExp =
    RegExp(r'^(?=.*[0-9])(?=.*[!$#^*])[A-Za-z0-9!$#^*]{8,}$');
    return passwordRegExp.hasMatch(password);
  }
  static bool isPhoneValid(String phone){
    RegExp phoneRegExp =
        RegExp(r'^01[0-2]\d{1,8}$');
    return phoneRegExp.hasMatch(phone);
  }
}