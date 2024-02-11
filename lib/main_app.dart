import 'package:demoapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true),
      routerConfig: ref.watch(router),
    );
  }
}
