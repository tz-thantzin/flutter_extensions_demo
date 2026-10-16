import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_extensions_demo/l10n/app_localizations.dart';

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
  Text bold() => _withStyle(
    (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.bold),
  );

  Text color(Color color) =>
      _withStyle((style ?? const TextStyle()).copyWith(color: color));

  Text size(double fontSize) =>
      _withStyle((style ?? const TextStyle()).copyWith(fontSize: fontSize));

  Text _withStyle(TextStyle nextStyle) => Text(
    data ?? '',
    style: nextStyle,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    locale: locale,
    softWrap: softWrap,
    overflow: overflow,
    maxLines: maxLines,
    semanticsLabel: semanticsLabel,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
    selectionColor: selectionColor,
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
  /// Adds a debounced listener and returns a callback that removes it.
  VoidCallback addDebouncedListener(
    VoidCallback onChanged, {
    Duration duration = const Duration(milliseconds: 500),
  }) {
    Timer? debounceTimer;
    void listener() {
      debounceTimer?.cancel();
      debounceTimer = Timer(duration, onChanged);
    }

    addListener(listener);
    return () {
      removeListener(listener);
      debounceTimer?.cancel();
    };
  }
}

/// 7️⃣ BuildContext Extensions
extension ContextExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  Size get mediaSize => MediaQuery.sizeOf(this);
  double get width => mediaSize.width;
  double get height => mediaSize.height;
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
      RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(trimmed);
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
