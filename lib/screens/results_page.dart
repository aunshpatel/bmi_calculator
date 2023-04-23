import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../components/constants.dart';
import '../components/reusable_card.dart';

class  ResultsPage extends StatelessWidget {
  ResultsPage(this.interpretation, this.bmiResult, this.resultText);
  final String bmiResult, resultText, interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('BMI CALCULATOR'),
        //title: Center(child: const Text('BMI CALCULATOR')),
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              // child:Center(
              //   child: Text("Your Result",style: kTitleTextStyle,),
              // ),
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result",style: kTitleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              child: ReusableCard(
                kActiveCardColour,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(resultText, textAlign:TextAlign.center, style: kResultTextStyle),
                    //Text("Normal", textAlign:TextAlign.center, style: kResultTextStyle),
                    Text(bmiResult,  textAlign:TextAlign.center,style:kBMITextStyle),
                    //Text("18.3",  textAlign:TextAlign.center,style:kBMITextStyle),
                    Text(interpretation, textAlign:TextAlign.center,style:kBodyTextStyle),
                    //Text("Your BMI result is quite low, please eat more food!", textAlign:TextAlign.center,style:kBodyTextStyle),

                  ],
                ),
                (){
                  null;
                },
              ),
            )
          ),
          BottomButton(
            (){
              //Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()));
              Navigator.pop(context);
            },
            "RE-CALCULATE"
          ),

        ],
      ),
    );
  }
}
