import 'dart:io';

import 'package:imc_calculate/imc_calculate.dart';
import 'package:imc_calculate/imc_calculate_impl.dart';

void main(List<String> arguments) {
  ImcCalculate instance = ImcCalculateImpl(getName());
  var imc = instance.calculate(weight: getWeight(), height: getHeight());
  print('Resultado: $imc');
  print('Analise: \n${instance.analyse(imc: imc)}');
}

String getName() {
  String value = '';
  while (value.isEmpty) {
    print('Informe seu nome: ');
    value = stdin.readLineSync() ?? '';
    if (value.isEmpty) {
      print('É obrigatório a informação do nome!\n');
    }
  }
  return value;
}

int getWeight() {
  int value = 0;
  while (value <= 0) {
    print('Informe seu peso: ');
    value = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    if (value <= 0) {
      print('É obrigatório a informação de um peso válido!\n');
    }
  }
  return value;
}

double getHeight() {
  double value = 0;
  while (value <= 0) {
    print('Informe sua altura: ');
    var temp = (stdin.readLineSync() ?? '').replaceAll(',', '.');
    value = double.tryParse(temp) ?? 0;
    if (value <= 0) {
      print('É obrigatório a informação de uma altura válida!\n');
    }
  }
  return value;
}
