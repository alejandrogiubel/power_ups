extension StringExtension on String {

  ///Capitalize first letter
  String get inCapFirst =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  ///Capitalize all letters
  String get allInCaps => toUpperCase();

  ///Capitalize first letter of each word
  String get capitalizeFirstOfEach =>
      split(' ').map<dynamic>((str) => str.inCapFirst).join(' ');


  ///True if is a valid email
  bool get isEmail => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+",
      ).hasMatch(this);
}
