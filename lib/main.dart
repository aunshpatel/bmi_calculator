import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary:Color(0xff0A0E21), secondary: Colors.purple),
        scaffoldBackgroundColor:Color(0xff0A0E21),
        //textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white,),
      ),
      initialRoute: "/",
      routes: {
        '/':(context)=>InputPage(),
      },
    );
  }
}


