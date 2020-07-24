import 'package:bmi_calculator/component/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../constants.dart';
import '../component/reusablecard.dart';


class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult,@required this.resultText, @required this.resulinterpretation});

  final String bmiResult;
  final String resultText;
  final String resulinterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text('Your Result',style:ktitleTextSyle ,),
            ),
          ),
          Expanded(
            flex: 5,
            child:ReusableCard(
              colour: kpagecolor1,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),style: kresultTextSyle,),
                  Text(bmiResult,style: kBMITextSyle,),
                  Text(resulinterpretation,style: kbodyTextSyle,textAlign: TextAlign.center,),
                ],
              ),
            ) ,
          ),
          bottombutton(ontap: (){
            Navigator.pop(context);
          }, title: 'RE-Calculate')
        ],
      ),
    );
  }
}
