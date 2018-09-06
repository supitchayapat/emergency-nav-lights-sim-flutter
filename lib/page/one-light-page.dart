import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OneLightPage extends StatefulWidget {
  OneLightPage(this.color);

  final Color color;

  @override
  State<OneLightPage> createState() {
    return _LightPageState(this.color);
  }
}

class _LightPageState extends State<OneLightPage> with SingleTickerProviderStateMixin {
  _LightPageState(this.color);

  final Color color;

  Animation<Offset> animation;
  AnimationController controller;

  bool isShown = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);

    controller = AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    animation = Tween(begin: Offset(0.0, 0.0), end: Offset(0.0, -1.5)).animate(controller);

    this.hide();
  }

  @override
  void dispose() {
    controller.dispose();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.color,
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SlideTransition(
            position: animation,
            child: Container(
              margin: EdgeInsets.all(12.0),
              child: BackButton(),
            ),
          ),
          Expanded(
            child: GestureDetector(onTap: showBackButton),
          ),
        ],
      ))
    );
  }

  void showBackButton() {
    setState(() {
      if (animation.isCompleted) {
        controller.reverse();
        this.hide();
      }
    });
  }

  void hide() {
    Timer(Duration(seconds: 2), () {
      controller.forward();
    });
  }
}
