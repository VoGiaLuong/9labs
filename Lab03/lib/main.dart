import 'package:flutter/material.dart';
import 'package:lab03_vogialuong/GradientContainer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Banner(
        message: 'VoGiaLuong',
        location: BannerLocation.bottomEnd,
        child: child ?? const SizedBox.shrink(),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(Colors.purple, Colors.deepPurple)
      ) ,
    );
  }
}



