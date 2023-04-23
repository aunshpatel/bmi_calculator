import 'dart:math';

class CalculatorBrain {
  CalculatorBrain(this.height, this.weight);
  final int height, weight;
  double bmi = 0.0;

  String calulateBMI(){
    bmi = weight / pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResults(){
    calulateBMI();
    print("getResults() BMI: $bmi");
    if(bmi>=30){
      return 'Obese';
    }
    else if(bmi >=25 && bmi<30){
      return 'Overweight';
    }
    else if(bmi > 18.5 && bmi<=24.9){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getInterpretation() {
    calulateBMI();
    print("getInterpretation() BMI: $bmi");
    if(bmi >=25){
      return 'Your body weight is higher than normal. You need to exercise to reduce weight.';
    }
    else if(bmi > 18.5 && bmi<=24.9){
      return 'Congratulations! Your body weight is normal, please keep yourself this fit.';
    }
    else{
      return 'Your body weight is lower than normal. Please eat more and gain weight.';
    }
  }
}