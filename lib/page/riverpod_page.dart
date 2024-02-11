import 'package:demoapp/provider/riverpod_page_controller.dart';
import 'package:demoapp/provider/riverpod_page_controller_alive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodPage extends ConsumerWidget {
  const RiverpodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int countAlive = ref.watch(riverpodPageControllerAliveProvider(10));
    final int countNotAlive = ref.watch(riverpodPageControllerProvider(100));
    final riverpodPageControllerAliveNotifier =
        ref.read(riverpodPageControllerAliveProvider(10).notifier);
    final riverpodPageControllerNotifier =
        ref.read(riverpodPageControllerProvider(100).notifier);
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
                  onPressed: () =>
                      riverpodPageControllerAliveNotifier.increment(),
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () =>
                      riverpodPageControllerAliveNotifier.decrement(),
                  icon: const Icon(Icons.remove),
                ),
                TextButton(
                  onPressed: () => riverpodPageControllerAliveNotifier.reset(),
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
                  onPressed: () => riverpodPageControllerNotifier.increment(),
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () => riverpodPageControllerNotifier.decrement(),
                  icon: const Icon(Icons.remove),
                ),
                TextButton(
                  onPressed: () => riverpodPageControllerNotifier.reset(),
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
