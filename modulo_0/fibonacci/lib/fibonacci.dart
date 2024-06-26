abstract interface class Fibonacci {
  List<int> generate([int numberOfTerms = 10]);
}

class FibonacciImpl implements Fibonacci {
  @override
  List<int> generate([int numberOfTerms = 10]) {
    List<int> result = [1, 1];
    for (int i = 2; i < numberOfTerms; i++) {
      result.add(result[i - 2] + result[i - 1]);
    }
    return result;
  }
}
