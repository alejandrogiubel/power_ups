extension StringExtension on String {
  String get inCapFirst =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstOfEach =>
      split(' ').map<dynamic>((str) => str.inCapFirst).join(' ');
}
