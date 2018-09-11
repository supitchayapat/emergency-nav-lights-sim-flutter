
import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static Color red = Color.fromARGB(255,255,34,49);
  static Color green = Color.fromARGB(255,123,229,59);
  static Color grey = Color.fromARGB(255, 155, 155, 155);
  static Color dark = Color.fromARGB(255, 74, 74, 74);
}

double getTextScale(BuildContext context){
  var size = MediaQuery.of(context).size;
    var width = min(size.height, size.width);
    if (width > 1000) {
      return 1.2;
    } else if (width > 700) {
      return 1.0;
    } else {
      return 0.8;
    }
}