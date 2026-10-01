import 'package:flutter/material.dart';

void main() {
  runApp(const MiCard());
}

class MiCard extends StatelessWidget {
  const MiCard({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Banner(
        message: 'VoGiaLuong',
        location: BannerLocation.bottomEnd,
        child: child ?? const SizedBox.shrink(),
      ),
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text(
            "MiCard Flutter Project",
            style: TextStyle(
                fontFamily: "Source Sans Pro",
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/profile_picture.png"),
              ),
              Text(
                "VoGiaLuong",
                style: TextStyle(
                    fontFamily: "Source Sans Pro",
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "FULLSTACK DEVELOPER",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Source Sans Pro",
                    letterSpacing: 2.5),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "0963020667",
                      style:
                          TextStyle(color: Colors.teal.shade900, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 30.0),
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "luongvg.23it@vku.udn.vn",
                      style:
                          TextStyle(color: Colors.teal.shade900, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
