import 'package:bmi_calculator/components/rounded_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class LabelActionContent extends StatelessWidget {
  final String label;
  final String value;

  final Function incrementAction;
  final Function decrementAction;

  const LabelActionContent(
      {Key? key,
      required this.incrementAction,
      required this.decrementAction,
      required this.label,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Text(
          value,
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundIconButton(
              onPressed: decrementAction,
              icon: FontAwesomeIcons.minus,
            ),
            RoundIconButton(
              onPressed: incrementAction,
              icon: FontAwesomeIcons.plus,
            ),
          ],
        ),
      ],
    );
  }
}
