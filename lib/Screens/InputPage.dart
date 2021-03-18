import 'dart:ui';

import 'package:bmi_calculator/components/IconContent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/ReusableCard.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/constants.dart';
import '../components/Gender.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'ResultPage.dart';
import 'package:bmi_calculator/Functionality/CalculatorBrain.dart';

class InputPage extends StatefulWidget {
  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'BMI Calculator',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: selectedGender == Gender.MALE
                          ? KActiveCardColor
                          : KInActiveCardColor,
                      cardChild: GenderWidget(FontAwesomeIcons.mars, 'MALE'),
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.MALE;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: selectedGender == Gender.FEMALE
                          ? KActiveCardColor
                          : KInActiveCardColor,
                      cardChild: GenderWidget(FontAwesomeIcons.venus, 'FEMALE'),
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.FEMALE;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: KInActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: KLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: KNumberTextStyle,
                              ),
                              Text(
                                'cm',
                                style: KLabelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: Color(0xFF9D8E98),
                                activeTrackColor: Colors.white,
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x15EB1555),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0)),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 240.0,
                              activeColor: Color(0xFFEB1555),
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: KInActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 40) this.weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  this.weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: KInActiveCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (this.age > 12) this.age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  this.age++;
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
            )),
            BottomButton(
              onTap: () {
                CalculatorBrain calculatorBrain =
                    CalculatorBrain(this.weight, this.height);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calculatorBrain.calculateBMI(),
                              resultText: calculatorBrain.getResult(),
                              interpretation:
                                  calculatorBrain.getInterpretation(),
                            )));
              },
              text: 'Calculate',
            ),
          ],
        ));
  }
}
