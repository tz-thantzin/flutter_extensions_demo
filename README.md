[![BuyMeACoffee](https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg)](https://buymeacoffee.com/devthantziq)

# Flutter Extensions Demo

A small Flutter app with hands-on examples of Dart extension methods. It shows how extensions can make common widget composition and value formatting easier to read while keeping the normal Flutter widgets visible in the code.

---

## Examples

The app has three example pages:

- **Part 1:** taps, padding, margins, visibility, centering, flex, cards, clipping, backgrounds, and alignment.
- **Part 2:** tooltips, scrolling, text styles, opacity animation, safe area, debounced input, `BuildContext` helpers, snackbars, controller utilities, and dates.
- **Part 3:** directional padding, symmetric margins, sizing, borders, opacity, rotation, and string display helpers.

Each example is implemented in `lib/extensions/` and used on its corresponding screen in `lib/screens/`.

### BuildContext and localization

Part 2 provides shortcuts for screen size and generated app strings:

```dart
import 'package:flutter_extensions_demo/extensions/ex_part2.dart';

final size = context.mediaSize; // MediaQuery.sizeOf(context)
final width = context.width;
final height = context.height;
final title = context.l10n.appTitle; // AppLocalizations.of(context)!.appTitle
```

The app includes English and Spanish strings in `lib/l10n/*.arb` and follows the device locale. After editing an ARB file, run `flutter gen-l10n` to regenerate the localization classes.

## Run the app

```sh
flutter pub get
flutter run
```

## Add an extension

Extensions are ordinary Dart methods declared on an existing type. Import the file where the extension is defined to use it:

```dart
import 'package:flutter/material.dart';

extension PaddingHelpers on Widget {
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);
}

// With the extension's file imported:
const Text('Hello').paddingAll(16);
```

---

## 📄 License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.


## ❤️ Support

Hi 👋 If you find this is useful, you can [buy me a coffee](https://buymeacoffee.com/devthantziq) ☕ to support my work and make my sleepless nights easier.
