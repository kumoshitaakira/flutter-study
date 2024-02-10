import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StatelessPage extends StatelessWidget {
  const StatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Helllo World'),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => context.goNamed('Stateful'),
              child: const Text('StatefulPage →'),
            ),
          ],
        ),
      ),
    );
  }
}
