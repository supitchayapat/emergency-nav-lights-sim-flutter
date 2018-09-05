import 'dart:async';
import 'package:emergency_nav_lights_sim/app-constant.dart';
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
    if (bool.fromEnvironment("dart.vm.product")) {
      startTime();
    }
  }

  bool isNav = false;

  void navigateToHome() {
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
        child: Stack(
          children: <Widget>[
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(12.0),
                  child: Text("EMERGENCY\nNAV LIGHTS\nSIMULATOR",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32.0,
                          color: AppColors.dark,
                          fontFamily: "AzoSansUber")),
                ),
                Image.asset("assets/images/boat.png"),
              ],
            )),
            Container(
                margin: EdgeInsets.all(32.0),
                alignment: Alignment.bottomCenter,
                child: Text("build by SWARM",
                    style: TextStyle(color: AppColors.grey)))
          ],
        ),
        onTap: navigateToHome,
      ),
    );
  }
}
