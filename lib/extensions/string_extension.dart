import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

extension StringExtension on String {
  ///Capitalize first letter
  String get capFirst =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  ///Capitalize all letters
  String get capAll => toUpperCase();

  ///Capitalize first letter of each word
  String get capFirstOfEach =>
      split(' ').map<dynamic>((str) => str.capFirst).join(' ');

  ///True if is a valid email
  bool get isEmail => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+",
      ).hasMatch(this);

  ///Split a string by multiples tokens
  List<String> multiSplit(Iterable<String> delimeters) => delimeters.isEmpty
      ? [this]
      : split(RegExp(delimeters.map(RegExp.escape).join('|')));

  ///Print in console only in kDebugMode and return the same string
  String log({String debugName = ''}) {
    if (kDebugMode) {
      dev.log(
        this,
        name: debugName,
        // time: DateTime.now(),
      );
    }
    return this;
  }

  /// Copies the string to the clipboard.
  Future<void> get sendToClipBoard async {
    await Clipboard.setData(ClipboardData(text: this));
  }
}
