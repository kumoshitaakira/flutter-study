import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_page_controller.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@riverpod
class RiverpodPageController extends _$RiverpodPageController {
  @override
  int build() => 0;

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
