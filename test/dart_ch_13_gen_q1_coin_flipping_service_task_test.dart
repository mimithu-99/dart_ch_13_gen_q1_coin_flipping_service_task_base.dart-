import 'package:dart_ch_13_gen_q1_coin_flipping_service_task/dart_ch_13_gen_q1_coin_flipping_service_task.dart';
import 'package:test/test.dart';
void main() {
  group('Coin Flipping Service Tests', () {
    late CoinFlippingService coinFlipper;
 
    setUp(() {
      coinFlipper = CoinFlippingService();
    });
 
    test('Generates 10 random coin flips', () async {
      var flips = await coinFlipper.onFlip.take(10).toList();
      expect(flips.length, equals(10));
      for (var flip in flips) {
        expect(['Heads', 'Tails'].contains(flip), isTrue);
      }
    });
 
    test('Emits coin flips at 500ms intervals', () async {
      var stopwatch = Stopwatch()..start();
      await for (var _ in coinFlipper.onFlip.take(10)) {}
      stopwatch.stop();
      expect(stopwatch.elapsed, greaterThanOrEqualTo(Duration(milliseconds: 5000)));
    });
  });
}