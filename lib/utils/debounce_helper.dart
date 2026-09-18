import 'dart:async';

class DebounceHelper {
  final Duration delay;
  Timer? _timer;

  DebounceHelper({this.delay = const Duration(milliseconds: 500)});

  void run(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  void dispose() {
    _timer?.cancel();
  }
}
