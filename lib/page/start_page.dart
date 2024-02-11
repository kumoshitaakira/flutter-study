import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: SizedBox(
                width: size.width / 2,
                child: const Center(
                  child: Text('メールアドレスでログイン'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: SizedBox(
                width: size.width / 2,
                child: const Center(
                  child: Text('Googleアカウントでログイン'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
