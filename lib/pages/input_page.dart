import 'package:bmi_calculator/components/app_card.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: AppCard(),
                ),
                Expanded(
                  child: AppCard(),
                ),
              ],
            ),
          ),
          Expanded(
            child: AppCard(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: AppCard(),
                ),
                Expanded(
                  child: AppCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
