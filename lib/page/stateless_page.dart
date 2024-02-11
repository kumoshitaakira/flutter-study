import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StatelessPage extends ConsumerWidget {
  const StatelessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if (ref.watch(userStreamProvider).value == null) context.goNamed('Start');
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
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => context.goNamed('Riverpod'),
              child: const Text('RiverpodPage →'),
            ),
          ],
        ),
      ),
    );
  }
}
