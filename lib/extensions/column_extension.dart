import 'package:flutter/material.dart';

extension ColumnExtension on Column {
  ///Wrap this column with a scrollable widget
  SingleChildScrollView get scrollable => SingleChildScrollView(
        child: this,
      );
}
