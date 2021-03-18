import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double bmi;

  CalculatorBrain(this.weight, this.height);

  String calculateBMI() {
    this.bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return 'You have to make a diet';
    } else if (bmi >= 18.5) {
      return 'Your weight is normal';
    } else {
      return 'You have to eat more';
    }
  }
}
