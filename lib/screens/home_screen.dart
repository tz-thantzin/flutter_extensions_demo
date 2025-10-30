import 'package:flutter/material.dart';

import 'extension_part1_screen.dart';
import 'extension_part2_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pro Flutter Extensions'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.looks_one),
              label: const Text('Extension Part 1'),
              onPressed: () =>
                  Navigator.pushNamed(context, ExtensionPart1Screen.routeName),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.looks_two),
              label: const Text('Extension Part 2'),
              onPressed: () =>
                  Navigator.pushNamed(context, ExtensionPart2Screen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
