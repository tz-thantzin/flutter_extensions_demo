import 'package:flutter/material.dart';

import 'extensions/widget_ex.dart';

void main() {
  runApp(const ProExtensionApp());
}

class ProExtensionApp extends StatelessWidget {
  const ProExtensionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pro Flutter Extensions Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showMessage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pro Flutter Widget Extensions'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  Simple Tap
            Text('Tap Me!').paddingAll(16).card().onTap(() {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Card tapped!')));
            }).center(),

            const SizedBox(height: 20),

            // Rounded Image
            Image.network(
              'https://picsum.photos/300',
            ).rounded(16).paddingAll(8).card(),

            const SizedBox(height: 20),

            // Conditional Visibility
            Text(
              'This text can be hidden.',
            ).visible(showMessage).paddingAll(12).card(),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => setState(() => showMessage = !showMessage),
              child: Text(showMessage ? 'Hide Message' : 'Show Message'),
            ),

            const SizedBox(height: 30),

            //Background color with padding
            Text(
              'Colored Container',
            ).paddingAll(20).backgroundColor(Colors.amber.shade100).card(),

            const SizedBox(height: 20),

            //Expanded in Row
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

            const SizedBox(height: 20),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
