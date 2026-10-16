import 'package:flutter/material.dart';

/// Adds focused layout helpers without hiding the underlying Flutter widgets.
extension LayoutExtensions on Widget {
  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );

  Widget marginSymmetric({double horizontal = 0, double vertical = 0}) =>
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  Widget sized({double? width, double? height}) =>
      SizedBox(width: width, height: height, child: this);

  Widget bordered({
    Color color = Colors.transparent,
    Color borderColor = Colors.blueGrey,
    double borderWidth = 1,
    double radius = 12,
  }) =>
      DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: this,
      );

  Widget faded(double opacity) =>
      Opacity(opacity: opacity.clamp(0.0, 1.0).toDouble(), child: this);

  /// Rotates in quarter turns, matching [RotatedBox] conventions.
  Widget quarterTurns(int turns) =>
      RotatedBox(quarterTurns: turns, child: this);
}

extension StringDisplayExtensions on String {
  bool get isBlank => trim().isEmpty;

  String get capitalizeFirst => isEmpty
      ? this
      : '${this[0].toUpperCase()}${substring(1)}';

  String get titleCase => trim()
      .split(RegExp(r'\s+'))
      .where((word) => word.isNotEmpty)
      .map((word) => word.capitalizeFirst)
      .join(' ');

  String get initials {
    final words = trim().split(RegExp(r'\s+')).where((word) => word.isNotEmpty);
    return words.take(2).map((word) => word[0].toUpperCase()).join();
  }
}
