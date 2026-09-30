import 'package:flutter/material.dart';
import 'dart:math';

class DuceRoller extends StatefulWidget{
  const DuceRoller({super.key});

  @override
  State<DuceRoller> createState() => DuceRollerState();
}

class DuceRollerState extends State<DuceRoller>{
  var currentDice = 1;

  void rollDice(){
    setState(() {
      currentDice = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("images/dice_$currentDice.png", width: 200,),
        const SizedBox(height: 30,),
        TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 28,
              ),
              foregroundColor: Colors.white,
            ),
            onPressed: rollDice,
            child: const Text('Roll Dice')
        )
      ],
    );
  }
}