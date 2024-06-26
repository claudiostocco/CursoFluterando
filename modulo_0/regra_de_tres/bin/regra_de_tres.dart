import 'dart:io';

void main(List<String> arguments) {
  print('Inforne os valores:');
  RegraDeTres instance = RegraDeTres();
  while (true) {
    instance.getValues();
    if (instance.isNullArgError) {
      print('Somente um valor pode/deve ser vazio!');
    } else {
      break;
    }
  }

  print(
      'O resultado da regra de três para o argumento "${instance.getNameNullArg}" é: ${instance.calculate()}!');
}

class RegraDeTres {
  final _args = ['x11', 'x12', 'x21', 'x22'];
  final List<double?> _values = [];

  int get getNullArg => _values.indexOf(null);
  String get getNameNullArg => _args.elementAt(getNullArg);
  bool get isNullArgError {
    var i = getNullArg;
    return i < 0 || i != _values.lastIndexOf(null);
  }

  void getValues() {
    _values.clear();
    _values.addAll(_args.map((arg) => _getValue(arg)));
  }

  double? _getValue(String arg) {
    print('Informe "$arg": ');
    var temp = (stdin.readLineSync() ?? '').replaceAll(',', '.');
    return double.tryParse(temp);
  }

  double _getDoubleValue(int i) => _values[i]!;

  double calculate() {
    switch (getNullArg) {
      case 0:
        return _getDoubleValue(1) * _getDoubleValue(2) / _getDoubleValue(3);
      case 1:
        return _getDoubleValue(0) * _getDoubleValue(3) / _getDoubleValue(2);
      case 2:
        return _getDoubleValue(3) * _getDoubleValue(3) / _getDoubleValue(1);
      default:
        return _getDoubleValue(1) * _getDoubleValue(2) / _getDoubleValue(0);
    }
  }
}
