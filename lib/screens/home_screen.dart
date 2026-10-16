import 'package:flutter/material.dart';
import 'package:flutter_extensions_demo/extensions/ex_part2.dart';

import 'extension_part1_screen.dart';
import 'extension_part2_screen.dart';
import 'extension_part3_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.looks_one),
              label: Text(context.l10n.partOne),
              onPressed: () =>
                  Navigator.pushNamed(context, ExtensionPart1Screen.routeName),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.looks_two),
              label: Text(context.l10n.partTwo),
              onPressed: () =>
                  Navigator.pushNamed(context, ExtensionPart2Screen.routeName),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.looks_3),
              label: Text(context.l10n.partThree),
              onPressed: () =>
                  Navigator.pushNamed(context, ExtensionPart3Screen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
