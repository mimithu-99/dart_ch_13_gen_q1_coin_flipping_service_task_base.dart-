/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

export 'src/dart_ch_13_gen_q1_coin_flipping_service_task_base.dart';

// TODO: Export any libraries intended for clients of this package.


class CoinFlippingService {
  Stream<String> get onFlip => _coinFlipper();

  Stream<String> _coinFlipper() async* {
    int counter = 0;
    while (true) {
      await Future<void>.delayed(Duration(milliseconds: 500));
      if (counter.isEven) {
        yield 'Heads';
      } else {
        yield 'tails';
      }
      counter++;
    }
  }
}
