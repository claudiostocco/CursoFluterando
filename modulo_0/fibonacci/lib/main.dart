import 'dart:io';

import 'package:fibonacci/fibonacci.dart';

void main(List<String> arguments) {
  print('Fibonacci sequence: ${FibonacciImpl().generate(getTerms())}!');
}

int getTerms() {
  int value = 0;
  while (value <= 0) {
    print('Informe o número de termos: ');
    value = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    if (value < 2) {
      print('Menor que dois não permitido!\n');
      return getTerms();
    }
  }
  return value;
}
