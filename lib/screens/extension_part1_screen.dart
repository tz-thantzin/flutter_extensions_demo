import 'package:flutter/material.dart';

import '../extensions/ex_part1.dart';

class ExtensionPart1Screen extends StatefulWidget {
  const ExtensionPart1Screen({super.key});
  static const routeName = '/extension_part1';

  @override
  State<ExtensionPart1Screen> createState() => _ExtensionPart1ScreenState();
}

class _ExtensionPart1ScreenState extends State<ExtensionPart1Screen> {
  bool showMessage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Extensions — Part 1'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Tap Me!').paddingAll(16).card().onTap(() {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Card tapped!')));
            }).center(),

            const SizedBox(height: 20),

            Image.network(
              'https://picsum.photos/300',
            ).rounded(16).paddingAll(8).card(),

            const SizedBox(height: 20),

            Text(
              'This text can be hidden.',
            ).visible(showMessage).paddingAll(12).card(),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => setState(() => showMessage = !showMessage),
              child: Text(showMessage ? 'Hide Message' : 'Show Message'),
            ),

            const SizedBox(height: 30),

            Text(
              'Colored Container',
            ).paddingAll(20).backgroundColor(Colors.amber.shade100).card(),

            const SizedBox(height: 20),

            Row(
              children: [
                Text('Left Box')
                    .backgroundColor(Colors.purple.shade100)
                    .paddingAll(12)
                    .center()
                    .expanded(),
                Text('Right Box')
                    .backgroundColor(Colors.green.shade100)
                    .paddingAll(12)
                    .center()
                    .expanded(),
              ],
            ).paddingSymmetric(vertical: 8).card(),

            const SizedBox(height: 20),

            Container(
              height: 120,
              color: Colors.grey.shade200,
              child: Text('Aligned Bottom Right')
                  .backgroundColor(Colors.blue.shade100)
                  .paddingAll(8)
                  .card()
                  .align(Alignment.bottomRight),
            ).paddingAll(16),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
