import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
  MaterialApp(
      builder: (context, child) => Banner(
        message: 'VoGiaLuong',
        location: BannerLocation.bottomEnd,
        child: child ?? const SizedBox.shrink(),
      ),
    home: BallPage(),
  ),
);

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Ask me anything'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      body: const Ball(),
    )
      ;
  }
}

class Ball extends StatefulWidget{
  const Ball ({Key? key}) : super(key: key);

  @override
  BallState createState() => BallState();
}

class BallState extends State<Ball>{
  int ballNumber = 1;

  void updateImage(){
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: updateImage,
          child: Image.asset('images/ball$ballNumber.png')),
    );
  }

}