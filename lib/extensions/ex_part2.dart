import 'dart:async';

import 'package:flutter/material.dart';

/// 1️⃣ Tooltip Extension
extension TooltipExtension on Widget {
  Widget tooltip(String message) => Tooltip(message: message, child: this);
}

/// 2️⃣ Scrollable Extension
extension ScrollableExtension on Widget {
  Widget scrollable({Axis axis = Axis.vertical}) =>
      SingleChildScrollView(scrollDirection: axis, child: this);
}

/// 3️⃣ TextStyle Fluent Extension
extension TextStyleExtension on Text {
  Text bold() => Text(
    data ?? '',
    style: (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.bold),
  );

  Text color(Color color) => Text(
    data ?? '',
    style: (style ?? const TextStyle()).copyWith(color: color),
  );

  Text size(double fontSize) => Text(
    data ?? '',
    style: (style ?? const TextStyle()).copyWith(fontSize: fontSize),
  );
}

/// 4️⃣ Animate Opacity
extension AnimateOpacityExtension on Widget {
  Widget animateOpacity({
    required bool visible,
    Duration duration = const Duration(milliseconds: 400),
  }) => AnimatedOpacity(
    opacity: visible ? 1.0 : 0.0,
    duration: duration,
    child: this,
  );
}

/// 5️⃣ Safe Area Wrapper
extension SafeAreaExtension on Widget {
  Widget safe({bool top = true, bool bottom = true}) =>
      SafeArea(top: top, bottom: bottom, child: this);
}

/// 6️⃣ Debounce for TextEditingController
extension DebounceExtension on TextEditingController {
  void debounce(
    VoidCallback onChanged, {
    Duration duration = const Duration(milliseconds: 500),
  }) {
    Timer? _debounce;
    addListener(() {
      _debounce?.cancel();
      _debounce = Timer(duration, onChanged);
    });
  }
}

/// 7️⃣ BuildContext Extensions
extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

/// 8️⃣ Show SnackBar
extension ContextSnackBarExtension on BuildContext {
  void showSnackBar(String message, {Color? background}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: background ?? Colors.black87,
      ),
    );
  }
}

/// 9️⃣ TextEditingController Utilities
extension TextControllerUtils on TextEditingController {
  String get trimmed => text.trim();
  bool get isEmpty => trimmed.isEmpty;
  bool get isNotEmpty => trimmed.isNotEmpty;

  bool get isEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(trimmed);
}

/// 🔟 DateTime Utilities
extension DateTimeExtension on DateTime {
  String toShortDate() =>
      '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';
  String toTime() =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  bool isSameDay(DateTime other) =>
      day == other.day && month == other.month && year == other.year;
}
