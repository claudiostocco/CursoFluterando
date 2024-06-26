import 'dart:math';

import 'package:imc_calculate/imc_calculate.dart';

const _kNormalWeight = 20;
const _kOverweight = 25;
const _kObesity = 30;
const _kMorbidObesity = 35;

class ImcCalculateImpl implements ImcCalculate {
  final String _name;
  ImcCalculateImpl(this._name);

  @override
  String analyse({required double imc}) {
    String result;
    if (imc < _kNormalWeight) {
      result = 'Atenção! Você está abaixo do peso.';
    } else if (imc < _kOverweight) {
      result = 'Parabéns, seu peso está dentro dos parâmetros estabelecidos!';
    } else if (imc < _kObesity) {
      result = 'Atenção! Você está com sobrepeso.';
    } else if (imc < _kMorbidObesity) {
      result = 'Cuidado! Você está na faixa de obesidade.';
    } else {
      result =
          'Cuidado! Você está na faixa de obesidade mórbida, está condição pode acarretar severos riscos à sua saúde.';
    }
    return '$_name\n$result';
  }

  @override
  double calculate({required int weight, required double height}) {
    var heightSquare = pow(height, 2);
    return (weight / heightSquare * 100).roundToDouble() / 100;
  }
}
