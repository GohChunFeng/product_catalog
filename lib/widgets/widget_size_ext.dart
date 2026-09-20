import 'package:flutter/cupertino.dart';

extension WidgetSizeExtension on Widget {
  Widget withSize({double? width, double? height}) {
    return SizedBox(width: width, height: height, child: this);
  }

  Widget withSquare(double dimension) {
    return SizedBox.square(dimension: dimension, child: this);
  }

  Widget withWidth(double width) {
    return SizedBox(width: width, child: this);
  }

  Widget withHeight(double height) {
    return SizedBox(height: height, child: this);
  }

  Widget expanded({int flex = 1, bool isExpand = true}) {
    if (isExpand) {
      return Expanded(flex: flex, child: this);
    }

    /// Determine whether to expand based on isExpand.
    return this;
  }

  Widget flexible({int flex = 1}) {
    return Flexible(flex: flex, child: this);
  }

  Widget withPadding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  Widget rotateLayout(int quarterTurns) {
    return RotatedBox(quarterTurns: quarterTurns, child: this);
  }
}
