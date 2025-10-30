import 'package:flutter/material.dart';
import 'package:flutter_extensions_demo/extensions/ex_part1.dart';
import 'package:flutter_extensions_demo/extensions/ex_part2.dart';

class ExtensionPart2Screen extends StatefulWidget {
  const ExtensionPart2Screen({super.key});
  static const routeName = '/extension_part2';

  @override
  State<ExtensionPart2Screen> createState() => _ExtensionPart2ScreenState();
}

class _ExtensionPart2ScreenState extends State<ExtensionPart2Screen> {
  bool isVisible = true;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.debounce(() {
      debugPrint('Search: ${controller.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Extensions — Part 2'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Icon(
              Icons.info,
            ).tooltip('More Information').paddingAll(16).card().center(),

            const SizedBox(height: 20),

            Column(
              children: List.generate(20, (i) => Text('Item $i')),
            ).scrollable().paddingAll(16).card(),

            const SizedBox(height: 20),

            Text(
              'Stylish Text',
            ).bold().color(Colors.blue).size(18).paddingAll(8),

            const SizedBox(height: 20),

            Text(
              'Fade In/Out Text',
            ).animateOpacity(visible: isVisible).paddingAll(12).card(),

            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => setState(() => isVisible = !isVisible),
              child: Text(isVisible ? 'Hide Text' : 'Show Text'),
            ),

            const SizedBox(height: 20),

            Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type something here...', // <-- added hint text
                  ),
                ).paddingAll(8).card(),
              ],
            ),

            const SizedBox(height: 20),

            Container(
              width: context.width * 0.8,
              height: context.height * 0.2,
              color: context.isDarkMode ? Colors.black : Colors.white,
              child: Center(child: Text('Context Extension Example')),
            ).paddingAll(16).card(),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () =>
                  context.showSnackBar('Profile saved successfully!'),
              child: const Text('Show SnackBar'),
            ),

            const SizedBox(height: 20),

            Text(
              'DateTime: ${DateTime.now().toShortDate()} ${DateTime.now().toTime()}',
            ).paddingAll(12).card(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
