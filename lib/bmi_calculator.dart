import 'dart:math';

class BMICalculator {
  final double height;
  final double weight;

  double? _bmi;

  BMICalculator({required this.height, required this.weight});

  String calculte() {
    _bmi = weight / pow(height / 100, 2);
    print(_bmi);
    return _bmi!.toStringAsFixed(1);
  }

  String getResultText() {
    if (_bmi! >= 25) return 'OVERWEIGHT';
    if (_bmi! >= 18.5) return 'NORMAL';
    return 'UNDERWEIGHT';
  }

  String getInterpretation() {
    if (_bmi! >= 25)
      return 'You have a higher than normal body weight. Try to exercise more.';
    if (_bmi! >= 18.5) return 'You have normal body weight. Good job.';
    return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}
