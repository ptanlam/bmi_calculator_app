import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String label;

  final Function onPressed;

  const BottomButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: 20.0,
        ),
        child: Center(
          child: Text(
            label,
            style: kLargeTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
