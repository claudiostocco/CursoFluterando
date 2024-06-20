abstract class Fibonacci {
  List<int> generate([int numberOfTerms = 10]);
}

class FibonacciImpl implements Fibonacci {
  @override
  List<int> generate([int numberOfTerms = 10]) {
    return List.generate(numberOfTerms, (index) {
      if (index <= 2) {
        return index;
      } else {
        return index + (index - 1);
      }
    });
  }
}
