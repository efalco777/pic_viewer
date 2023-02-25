import 'dart:async';

typedef DebouncerCallback = void Function();

class Debouncer {
  final Map<String, _DebouncerOperation> _operations = {};

  void debounce({
    required String tag,
    required Duration duration,
    required DebouncerCallback callback,
  }) {
    if (duration == Duration.zero) {
      _operations[tag]?.timer.cancel();
      _operations.remove(tag);
      callback();
    } else {
      _operations[tag]?.timer.cancel();

      _operations[tag] = _DebouncerOperation(
        callback,
        Timer(duration, () {
          _operations[tag]?.timer.cancel();
          _operations.remove(tag);

          callback();
        }),
      );
    }
  }

  void cancel(String tag) {
    _operations[tag]?.timer.cancel();
    _operations.remove(tag);
  }

  void cancelAll() {
    for (final operation in _operations.values) {
      operation.timer.cancel();
    }
    _operations.clear();
  }
}

class _DebouncerOperation {
  final DebouncerCallback callback;
  final Timer timer;

  const _DebouncerOperation(this.callback, this.timer);
}
