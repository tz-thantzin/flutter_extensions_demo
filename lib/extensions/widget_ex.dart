import 'package:flutter/material.dart';

/// 1️⃣ Add Tap Gesture to Any Widget
extension OnTapExtension on Widget {
  Widget onTap(
    VoidCallback onTap, {
    HitTestBehavior behavior = HitTestBehavior.opaque,
  }) {
    return GestureDetector(onTap: onTap, behavior: behavior, child: this);
  }
}

/// 2️⃣ Add Padding to Any Widget
extension PaddingExtension on Widget {
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );
}

/// 3️⃣ Add Margin Outside Widget
extension MarginExtension on Widget {
  Widget marginAll(double value) =>
      Container(margin: EdgeInsets.all(value), child: this);
}

/// 4️⃣ Conditional Visibility
extension VisibilityExtension on Widget {
  Widget visible(bool isVisible) => isVisible ? this : const SizedBox.shrink();
}

/// 5️⃣ Center Any Widget Easily
extension CenterExtension on Widget {
  Widget center() => Center(child: this);
}

/// 6️⃣ Expanded or Flexible Wrapper
extension FlexExtension on Widget {
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget flexible({int flex = 1}) => Flexible(flex: flex, child: this);
}

/// 7️⃣ Wrap Widget in a Card
extension CardExtension on Widget {
  Widget card({
    EdgeInsets padding = const EdgeInsets.all(12),
    double elevation = 3,
    double borderRadius = 12,
  }) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(padding: padding, child: this),
    );
  }
}

/// 8️⃣ Rounded Corners
extension RoundedExtension on Widget {
  Widget rounded(double radius) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
}

/// 9️⃣ Add Background Color
extension BackgroundExtension on Widget {
  Widget backgroundColor(Color color) => DecoratedBox(
    decoration: BoxDecoration(color: color),
    child: this,
  );
}

/// 🔟 Align Any Widget
extension AlignExtension on Widget {
  Widget align([Alignment alignment = Alignment.center]) =>
      Align(alignment: alignment, child: this);
}
