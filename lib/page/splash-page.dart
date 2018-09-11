import 'dart:async';
import 'dart:math';
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
        body: SafeArea(
            child: InkWell(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.all(16.0),
                    child: Text("EMERGENCY NAV LIGHTS SIMULATOR",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 32.0 * getTextScale(context),
                            color: AppColors.dark,
                            fontFamily: "AzoSansUber")),
                  )),
              Expanded(
                flex: 2,
                child: LayoutBuilder(builder: (_, box) {
                  var size = min<double>(box.maxHeight, box.maxWidth);

                  return Image.asset("assets/images/boat.png",
                      width: size, height: size);
                }),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      margin: EdgeInsets.all(32.0),
                      alignment: Alignment.bottomCenter,
                      child: Text("build by SWARM",
                          style: TextStyle(color: AppColors.grey))))
            ],
          ),
          onTap: navigateToHome,
        )));
  }
}
