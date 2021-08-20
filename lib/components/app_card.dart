import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Color color;
  final Widget? child;

  final Function? onPress;

  const AppCard({Key? key, required this.color, this.child, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress!();
      },
      child: Container(
        child: child,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
