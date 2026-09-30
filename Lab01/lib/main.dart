import 'package:flutter/material.dart';

void main() {
  runApp(const IamRich());
}

class IamRich extends StatelessWidget{
  const IamRich({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.amber.shade400,
            appBar: AppBar(
              title: Text("I'm Rich"),
              centerTitle: true,
              backgroundColor: Colors.amber.shade800,
            ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Image(image: AssetImage("images/diamond.png"),
            width: 300,),
          ],
        )
      )
          ))
    );
  }

}
