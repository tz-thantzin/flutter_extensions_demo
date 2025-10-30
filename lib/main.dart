import 'package:flutter/material.dart';

import 'screens/extension_part1_screen.dart';
import 'screens/extension_part2_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ProExtensionApp());
}

class ProExtensionApp extends StatelessWidget {
  const ProExtensionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pro Flutter Extensions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        ExtensionPart1Screen.routeName: (_) => const ExtensionPart1Screen(),
        ExtensionPart2Screen.routeName: (_) => const ExtensionPart2Screen(),
      },
    );
  }
}
