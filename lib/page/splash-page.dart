import 'dart:async';
import 'package:emergency_nav_lights_sim/page/home-page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  startTime() async {
    return new Timer(Duration(seconds: 2), navigateToHome);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  bool isNav = false;
  void navigateToHome(){
    if (isNav) return;

    isNav = true;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(12.0),
              child: Text("EMERGENCY\nNAV LIGHTS\nSIMULATOR",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32.0, fontFamily: "AzoSansUber")),
            ),
            Image.asset("assets/images/boat.png"),
            Container(
                margin: EdgeInsets.all(32.0),
                child: Text("build by SWARM", style: TextStyle(color: Color.fromARGB(255, 155, 155, 155)),  textAlign: TextAlign.center)),
          ],
        ),
        onTap: navigateToHome,
      ),
    );
  }
}
