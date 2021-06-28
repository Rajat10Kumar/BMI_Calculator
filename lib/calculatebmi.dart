import 'dart:math';

class CalculateBMI {
  CalculateBMI({this.weight, this.height});

  List<String> underWeight = [
    "You have a lower than normal body weight.",
    "Tips : You can eat a bit more.",
    "Don\'t Drink water before meals.",
    " Get a quality sleep."
  ];
  List<String> overWeight = [
    "You have a higher than normal body weight.",
    "Tips :  Try to exercise more .",
    "Drink water 1/2 hr before meals.",
    "Eat 2 meals per day only with high protein.",
    "Drink Coffee or Tea, avoid Sugary food.",
  ];
  List<String> normalWeight = [
    "You have a normal body weight.",
    "Tips : Stay Active.",
    "Relax and Sleep Well.",
    "Eat Healthy Food.",
  ];
  final int? height;
  final int? weight;

  double _bmi = 0.0;

  String calBmi() {
    _bmi = (weight! / pow(height! / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  List<String> getResultBody() {
    if (_bmi >= 25) {
      return overWeight;
    } else if (_bmi > 18.5) {
      return normalWeight;
    } else {
      return underWeight;
    }
  }
}
