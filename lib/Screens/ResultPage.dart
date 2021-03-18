import 'file:///C:/Users/Saeed/AndroidStudioProjects/bmi_calculator/lib/components/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/BottomButton.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              resultText.toUpperCase(),
              style: KLargeTextStyle,
            ),
          )),
          Expanded(
              flex: 6,
              child: ReusableCard(
                color: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText,
                      style: KNumberTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: KBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: KBodyTextStyle,
                    ),
                  ],
                ),
              )),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'RE-Calculate')
        ],
      ),
    );
  }
}
