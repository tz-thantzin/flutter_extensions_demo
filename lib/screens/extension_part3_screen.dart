import 'package:flutter/material.dart';

import '../extensions/ex_part3.dart';

class ExtensionPart3Screen extends StatelessWidget {
  const ExtensionPart3Screen({super.key});

  static const routeName = '/extension_part3';

  @override
  Widget build(BuildContext context) {
    const name = 'flutter extension examples';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Extensions — Part 3'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ExampleCard(
            title: 'Directional padding and margin',
            code: 'Text(...).paddingOnly(left: 16).marginSymmetric(vertical: 8)',
            child: const Text('Only the left side has extra padding.')
                .paddingOnly(left: 16, top: 8, bottom: 8)
                .marginSymmetric(vertical: 8)
                .bordered(color: Colors.blue.shade50),
          ),
          _ExampleCard(
            title: 'Sizing and borders',
            code: 'Icon(...).sized(width: 72, height: 56).bordered(...)',
            child: const Icon(Icons.extension, color: Colors.deepPurple)
                .sized(width: 72, height: 56)
                .bordered(
                  borderColor: Colors.deepPurple,
                  radius: 10,
                ),
          ),
          _ExampleCard(
            title: 'Opacity and rotation',
            code: 'Icon(...).faded(0.55)  •  Icon(...).quarterTurns(1)',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.lightbulb, size: 36, color: Colors.orange)
                    .faded(0.55),
                Icon(Icons.arrow_forward, size: 36, color: Colors.blue)
                    .quarterTurns(1),
              ],
            ),
          ),
          _ExampleCard(
            title: 'String display helpers',
            code: "name.titleCase  •  name.initials  •  ''.isBlank",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title case: ${name.titleCase}'),
                Text('Initials: ${name.initials}'),
                Text('Whitespace is blank: ${'   '.isBlank}'),
              ],
            ),
          ),
          _ExampleCard(
            title: 'Chain extensions with Flutter widgets',
            code: 'Text(...).paddingOnly(...).bordered(...).marginSymmetric(...)',
            child: Text('Each helper returns a widget, so calls can be chained.')
                .paddingOnly(left: 12, right: 12, top: 10, bottom: 10)
                .bordered(borderColor: Colors.teal, radius: 8)
                .marginSymmetric(vertical: 4),
          ),
        ],
      ),
    );
  }
}

class _ExampleCard extends StatelessWidget {
  const _ExampleCard({
    required this.title,
    required this.code,
    required this.child,
  });

  final String title;
  final String code;
  final Widget child;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(code, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 14),
          child,
        ],
      ),
    ),
  );
}
