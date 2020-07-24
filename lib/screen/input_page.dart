import 'package:bmi_calculator/component/reusablecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../component/customdata.dart';
import '../constants.dart';
import 'result_page.dart';
import '../component/bottom_button.dart';
import '../component/roundiconbutton.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedG;
  int height=180;
  int weight=30;
  int age =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    ontap:  (){
                      setState(() {
                        selectedG=Gender.male;
                         });
                              },
                    colour: selectedG==Gender.male?kpagecolor:kpagecolor1,
                    cardChild: customData(
                      icons: Icons.person,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    ontap: (){
                        print('jhgjn');
                        setState(() {
                         selectedG=Gender.female;
                        });
                            },
                    colour: selectedG==Gender.female?kpagecolor:kpagecolor1,
                    cardChild: customData(
                      icons: Icons.person,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',style: klableTextStyle,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(height.toString(),style: knumberTextSyle,),
                      Text('cm',style: klableTextStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      disabledActiveTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFFBDBE98),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour:kpagecolor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kpagecolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',style: klableTextStyle,),
                        Text(weight.toString(),style: knumberTextSyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            roundIconButton(
                              icon:FontAwesomeIcons.minus,
                              function: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            roundIconButton(
                              icon: FontAwesomeIcons.plus,
                              function: (){
                                setState(() {
                                  weight +=1;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kpagecolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',style: klableTextStyle,),
                        Text(age.toString(),style: knumberTextSyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            roundIconButton(
                              icon:FontAwesomeIcons.minus,
                              function: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            roundIconButton(
                              icon: FontAwesomeIcons.plus,
                              function: (){
                                setState(() {
                                  age +=1;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ),
          bottombutton(
            title:'CALCULATE',
            ontap:(){
              CalculatorBrain calculate = CalculatorBrain(height: height,weight: weight);
            Navigator.push(context,MaterialPageRoute(
                builder: (context){
                  return ResultsPage(
                    bmiResult: calculate.calculateBMI(),
                    resultText: calculate.getResult(),
                    resulinterpretation: calculate.getInterpretation(),
                  );
                }
            ));
          },),
        ],
      )

    );
  }
}





