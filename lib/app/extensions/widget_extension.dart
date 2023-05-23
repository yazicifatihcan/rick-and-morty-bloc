import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget isVisible(bool value, {double? height, double? width}) => value
      ? this
      : SizedBox(
          height: height,
          width: width,
        );
}
