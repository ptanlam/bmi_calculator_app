import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/components/app_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/label_action_content.dart';
import 'package:bmi_calculator/gender.dart';
import 'package:bmi_calculator/operator.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class InputScreen extends StatefulWidget {
  InputScreen({Key? key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender? selectedGender;
  double height = 180.0;
  double weight = 60.0;
  int age = 20;

  Color toggleMaleCardColor() {
    return selectedGender == Gender.Male
        ? kActiveCardColor
        : kInactiveCardColor;
  }

  Color toggleFemaleCardColor() {
    return selectedGender == Gender.Female
        ? kActiveCardColor
        : kInactiveCardColor;
  }

  void manipulateWeight(Operator operator) {
    switch (operator) {
      case Operator.Plus:
        setState(() {
          weight++;
        });
        break;
      case Operator.Minus:
        setState(() {
          weight--;
        });
        break;
    }
  }

  void manipulateAge(Operator operator) {
    switch (operator) {
      case Operator.Plus:
        setState(() {
          age++;
        });
        break;
      case Operator.Minus:
        setState(() {
          age--;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: AppCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    color: toggleMaleCardColor(),
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: AppCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    color: toggleFemaleCardColor(),
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AppCard(
              color: Color(0xFF1D1E33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 1.0,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height,
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (value) {
                        setState(() {
                          height = double.parse(value.toStringAsFixed(1));
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: AppCard(
                    color: Color(0xFF1D1E33),
                    child: LabelActionContent(
                      label: 'Weight',
                      value: '$weight',
                      incrementAction: () {
                        manipulateWeight(Operator.Plus);
                      },
                      decrementAction: () {
                        manipulateWeight(Operator.Minus);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: AppCard(
                    color: Color(0xFF1D1E33),
                    child: LabelActionContent(
                      label: 'Age',
                      value: '$age',
                      incrementAction: () {
                        manipulateAge(Operator.Plus);
                      },
                      decrementAction: () {
                        manipulateAge(Operator.Minus);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            label: 'RE-CALCULATE',
            onPressed: () {
              var bmiCalculator = BMICalculator(
                height: height,
                weight: weight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    bmiResult: bmiCalculator.calculte(),
                    resultText: bmiCalculator.getResultText(),
                    interpretation: bmiCalculator.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
