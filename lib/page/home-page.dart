import 'package:emergency_nav_lights_sim/app-constant.dart';
import 'package:emergency_nav_lights_sim/page/one-light-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  void navigateToOneLight(context, color) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OneLightPage(color)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var boxWidth = MediaQuery.of(context).size.width / 2.6;
    var boxHeight = boxWidth * 1.169;

    var boxMargin = MediaQuery.of(context).size.width / 2.0 - boxWidth - 15;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 48.0, bottom: 32.0),
                child: Text("Tap a color to activate the corresponding lights",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 36.0,
                        color: AppColors.dark,
                        fontFamily: "AzoSansUber")),
              ),
              Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.topLeft,
                  children: [
                    Positioned(
                        left: boxMargin,
                        child: InkWell(
                          onTap: () =>
                              navigateToOneLight(context, AppColors.red),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.0,
                                child: Text(
                                  "Port",
                                  style: TextStyle(
                                      fontSize: 18.0, color: AppColors.grey),
                                ),
                              ),
                              SizedBox(
                                width: boxWidth,
                                height: boxHeight,
                                child: SvgPicture.asset(
                                    "assets/images/redTriangle.svg"),
                              ),
                              SizedBox(height: 30.0)
                            ],
                          ),
                        )),
                    Positioned(
                      child: InkWell(
                        onTap: () => navigateToOneLight(context, Colors.white),
                        child: Column(children: [
                          SizedBox(height: 30.0),
                          SizedBox(
                            width: boxWidth,
                            height: boxHeight,
                            child: SvgPicture.asset(
                                "assets/images/whiteTriangle.svg"),
                          ),
                          SizedBox(
                            height: 30.0,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Stern",
                                style: TextStyle(
                                    fontSize: 18.0, color: AppColors.grey),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    Positioned(
                      right: boxMargin,
                      child: InkWell(
                          onTap: () =>
                              navigateToOneLight(context, AppColors.green),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.0,
                                child: Text(
                                  "Starboard",
                                  style: TextStyle(
                                      fontSize: 18.0, color: AppColors.grey),
                                ),
                              ),
                              SizedBox(
                                width: boxWidth,
                                height: boxHeight,
                                child: SvgPicture.asset(
                                    "assets/images/greenTriangle.svg"),
                              ),
                              SizedBox(height: 30.0)
                            ],
                          )),
                    )
                  ]),
              SizedBox(height: 100.0)
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(24.0),
            child: Text(
                "This app is not a replacement for real physical certified navigation lights. You should always check your running nav lights on aircraft, ships, and spacecraft, and always carry spares.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, color: AppColors.grey)),
          )
        ],
      ),
    );
  }
}
