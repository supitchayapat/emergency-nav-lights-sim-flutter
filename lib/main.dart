import 'package:emergency_nav_lights_sim/page/splash-page.dart';
import 'package:flutter/material.dart';

void main() => runApp(new EnlApp());

class EnlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Emergency NAV Ligths SIMULATOR',
      home: new SplashPage(),
    );
  }
}