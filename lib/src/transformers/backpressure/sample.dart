import 'dart:async';

import 'package:rxdart/src/transformers/backpressure/backpressure.dart';

/// A StreamTransformer that, when the specified sample stream emits
/// an item or completes, emits the most recently emitted item (if any)
/// emitted by the source stream since the previous emission from
/// the sample stream.
///
/// ### Example
///
///     new Stream.fromIterable([1, 2, 3])
///       .transform(new SampleStreamTransformer(new TimerStream(1, new Duration(seconds: 1)))
///       .listen(print); // prints 3
class SampleStreamTransformer<T> extends BackpressureStreamTransformer<T, T> {
  SampleStreamTransformer(Stream window(T event))
      : super(WindowStrategy.firstEventOnly, window,
            onWindowEnd: (Iterable<T> queue) => queue.last) {
    assert(window != null, 'window stream factory cannot be null');
  }
}
