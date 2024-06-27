import 'package:imc_calculate/imc_calculate.dart';
import 'package:imc_calculate/imc_calculate_impl.dart';
import 'package:test/test.dart';

void main() {
  ImcCalculate instance = ImcCalculateImpl('Claudio');

  test('calculate', () {
    expect(instance.calculate(weight: 80, height: 1.73), 26.73);
  });

  test('analyse', () {
    var imc = instance.calculate(weight: 80, height: 1.73);
    var result = 'Atenção! Você está com sobrepeso.';
    var name = 'Claudio';
    expect(instance.analyse(imc: imc), '$name\n$result');
  });
}
