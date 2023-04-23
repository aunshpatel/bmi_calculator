import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/constants.dart';
import '../components/icon_content.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;
  int height=130, weight = 60, age = 20;

  void updateColour(Gender selectedGender){
    if(selectedGender == Gender.male){
      if(maleCardColour == kInactiveCardColour && femaleCardColour == kInactiveCardColour){
        maleCardColour = kActiveCardColour;
      }
      else if(maleCardColour == kInactiveCardColour && femaleCardColour == kActiveCardColour){
        femaleCardColour = kInactiveCardColour;
        maleCardColour = kActiveCardColour;
      }
      else{
        maleCardColour = kInactiveCardColour;
      }
    }
    else if(selectedGender == Gender.female){
      if(femaleCardColour == kInactiveCardColour && maleCardColour == kInactiveCardColour){
        femaleCardColour = kActiveCardColour;
      }
      else if(femaleCardColour == kInactiveCardColour && maleCardColour == kActiveCardColour){
        maleCardColour = kInactiveCardColour;
        femaleCardColour = kActiveCardColour;
      }
      else{
        femaleCardColour = kInactiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: const Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    maleCardColour,
                    IconContent(
                        FontAwesomeIcons.mars,
                        'MALE'
                    ),
                    (){
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    femaleCardColour,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconContent(
                            FontAwesomeIcons.venus,
                            'FEMALE'
                        ),
                      ],
                    ),
                    (){
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
                kActiveCardColour,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                        thumbColor: Color(0XFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0XFF8D8E98),
                        overlayColor: Color(0X29EB1555)
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min:40.0,
                        max:220.0,
                        onChanged: (double newValue){
                          setState(() {
                            //height = newValue.toInt();
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                (){ setState(() { });},
              ),
          ),
          Expanded(
              child:Row(
                children: [
                  //Weight card
                  Expanded(
                    child:ReusableCard(
                      kActiveCardColour,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT", style: kLabelTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(weight.toString() , style: kNumberTextStyle,),
                              Text("kg" , style: kLabelTextStyle,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /*FloatingActionButton(
                                onPressed: null,
                                child: Icon(Icons.add, color: Colors.white,),
                                backgroundColor: Color(0XFF4C4F5E),
                              ),*/
                              RoundIconButton(
                                FontAwesomeIcons.minus,
                                (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                FontAwesomeIcons.plus,
                                (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      (){ setState(() { }); },
                    ),
                  ),

                  //Age card
                  Expanded(
                    child: ReusableCard(
                      kActiveCardColour,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE", style: kLabelTextStyle,),
                          Text(age.toString() , style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                FontAwesomeIcons.minus,
                                (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                FontAwesomeIcons.plus,
                                (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      (){ setState(() { });},
                    ),
                  ),
                ],
              ),
          ),
          BottomButton(
          (){
            CalculatorBrain calc = CalculatorBrain(height, weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(calc.getInterpretation(), calc.getResults(),calc.calulateBMI())));
           },
          "CALCULATE"
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}


enum Gender{male, female}

