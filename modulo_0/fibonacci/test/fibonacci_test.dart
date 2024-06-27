import 'package:fibonacci/fibonacci.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(FibonacciImpl().generate(), [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]);
  });
}
