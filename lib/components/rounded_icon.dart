import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;

  final Function onPressed;

  const RoundIconButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressed();
      },
      shape: CircleBorder(),
      fillColor: Color(0xff4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icon),
    );
  }
}
