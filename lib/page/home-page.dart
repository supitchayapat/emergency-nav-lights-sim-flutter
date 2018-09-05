import 'package:emergency_nav_lights_sim/app-constant.dart';
import 'package:emergency_nav_lights_sim/page/one-light-page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 28.0),
              child: Text("Tap a color to activate the corresponding lights",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28.0,
                      color: AppColors.dark,
                      fontFamily: "AzoSansUber")),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Port | Stern | Starboard",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                    height: 80.0,
                    color: AppColors.red,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OneLightPage(AppColors.red)),
                      );
                    }),
                MaterialButton(
                    height: 80.0,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OneLightPage(Colors.white)),
                      );
                    }),
                MaterialButton(
                    height: 80.0,
                    color: AppColors.green,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OneLightPage(AppColors.green)),
                      );
                    }),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 60.0, right: 16.0, bottom: 16.0, left: 16.0),
              child: Text(
                  "This app is not a replacement for real physical certified navigation lights. You should always check your running nav lights on aircraft, ships, and spacecraft, and always carry spares.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, color: AppColors.grey)),
            )
          ],
        ),
      ),
    );
  }
}
