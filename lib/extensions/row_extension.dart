import 'package:flutter/material.dart';

extension RowExtension on Row {
  ///Wrap this row with a scrollable widget
  SingleChildScrollView get scrollable => SingleChildScrollView(
        child: this,
      );
}
