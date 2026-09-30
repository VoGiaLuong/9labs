import 'package:flutter/material.dart';
import 'package:lab03_vogialuong/dice_roller.dart';

class GradientContainer extends StatelessWidget{
  const GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color1, color2
                ],)
        ),
      child: Center(
        child: DuceRoller()
      ),
    );

  }
}
