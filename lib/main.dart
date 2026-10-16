import 'package:flutter/material.dart';
import 'package:flutter_extensions_demo/l10n/app_localizations.dart';

import 'screens/extension_part1_screen.dart';
import 'screens/extension_part2_screen.dart';
import 'screens/extension_part3_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ProExtensionApp());
}

class ProExtensionApp extends StatelessWidget {
  const ProExtensionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        ExtensionPart1Screen.routeName: (_) => const ExtensionPart1Screen(),
        ExtensionPart2Screen.routeName: (_) => const ExtensionPart2Screen(),
        ExtensionPart3Screen.routeName: (_) => const ExtensionPart3Screen(),
      },
    );
  }
}
