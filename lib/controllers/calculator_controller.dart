import '../models/calculator_model.dart';

class CalculatorController {
  final CalculatorModel model;
  String _display = '';
  double _firstOperand = 0;
  double _secondOperand = 0;
  String? _operator; // Change to nullable type

  CalculatorController(this.model);

  String get display => _display;

  void numClick(String number) {
    _display += number;
  }

  void operatorClick(String operator) {
    if (_display.isNotEmpty) {
      _firstOperand = double.parse(_display);
      _operator = operator;
      _display = '';
    }
  }

  void calculate() {
    if (_display.isNotEmpty && _operator != null) {
      _secondOperand = double.parse(_display);
      switch (_operator) {
        case '+':
          model.add(_firstOperand, _secondOperand);
          break;
        case '-':
          model.subtract(_firstOperand, _secondOperand);
          break;
        case 'x':
          model.multiply(_firstOperand, _secondOperand);
          break;
        case '/':
          model.divide(_firstOperand, _secondOperand);
          break;
      }
      _display = model.result.toString();
      _firstOperand = model.result;
      _operator = null; // Set to null when done
    }
  }

  void clear() {
    _display = '';
    _firstOperand = 0;
    _secondOperand = 0;
    _operator = null; // Set to null when clearing
    model.clear();
  }
}
