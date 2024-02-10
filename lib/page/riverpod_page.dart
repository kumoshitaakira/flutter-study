import 'package:demoapp/provider/riverpod_page_controller.dart';
import 'package:demoapp/provider/riverpod_page_controller_alive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodPage extends ConsumerWidget {
  const RiverpodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int countAlive = ref.watch(riverpodPageControllerAliveProvider);
    final int countNotAlive = ref.watch(riverpodPageControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('カウント（Alive）: $countAlive'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => ref
                      .read(riverpodPageControllerAliveProvider.notifier)
                      .increment(),
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () => ref
                      .read(riverpodPageControllerAliveProvider.notifier)
                      .decrement(),
                  icon: const Icon(Icons.remove),
                ),
                TextButton(
                  onPressed: () => ref
                      .read(riverpodPageControllerAliveProvider.notifier)
                      .reset(),
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text('カウント（NotAlive）: $countNotAlive'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => ref
                      .read(riverpodPageControllerProvider.notifier)
                      .increment(),
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () => ref
                      .read(riverpodPageControllerProvider.notifier)
                      .decrement(),
                  icon: const Icon(Icons.remove),
                ),
                TextButton(
                  onPressed: () =>
                      ref.read(riverpodPageControllerProvider.notifier).reset(),
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
