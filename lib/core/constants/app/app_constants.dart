// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class ApplicationConstants {
  static const String API_BASE_URL = "http://192.168.1.20:9000";
  static RegExp EMAIL_REGEX = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}
