import 'package:flutter/material.dart';

class StatefullPage extends StatefulWidget {
  const StatefullPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  State<StatefulWidget> createState() {
    return _StatefullPageState();
  }
}

class _StatefullPageState extends State<StatefullPage> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  void incrementCount() {
    setState(() {
      count++;
    });
  }

  void decrementCount() {
    setState(() {
      if (count > 0) count--;
    });
  }

  void resetCount() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatefulPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('カウント: $count'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => incrementCount(),
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () => decrementCount(),
                  icon: const Icon(Icons.remove),
                ),
                TextButton(
                  onPressed: () => resetCount(),
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
