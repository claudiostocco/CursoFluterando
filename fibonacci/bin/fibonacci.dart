import 'dart:io';

void main(List<String> arguments) {
  print('Fibonacci sequence: ${generate(getTerms())}!');
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

List<int> generate([int numberOfTerms = 10]) {
  List<int> result = [1, 1];
  for (int i = 2; i < numberOfTerms; i++) {
    result.add(result[i - 2] + result[i - 1]);
  }
  return result;
}
