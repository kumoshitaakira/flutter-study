import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_page_controller_alive.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@Riverpod(keepAlive: true)
class RiverpodPageControllerAlive extends _$RiverpodPageControllerAlive {
  @override
  int build(int value) => (value * 2);

  void increment() {
    state++;
  }

  void decrement() {
    if (state > 0) state--;
  }

  void reset() {
    state = 0;
  }
}
