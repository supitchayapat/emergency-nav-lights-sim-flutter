import 'package:emergency_nav_lights_sim/app-constant.dart';
import 'package:emergency_nav_lights_sim/page/one-light-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Point {
  Point(this.x, this.y);

  double x;
  double y;

  @override
  String toString() {
    return "(${x.round()}, ${y.round()})";
  }
}

class Triangle {
  Triangle(this.a, this.b, this.c);

  Point a;
  Point b;
  Point c;

  @override
  String toString() {
    return "a=$a, b=$b, c=$c";
  }
}

Rect getRect(GlobalKey key) {
  var elem = key.currentContext.findRenderObject();
  var translation = elem.getTransformTo(null)?.getTranslation();
  var size = elem?.semanticBounds?.size;
  return Rect.fromLTWH(translation.x, translation.y, size.width, size.height);
}

class HomePage extends StatelessWidget {
  GlobalKey redTriangleKey = GlobalKey(debugLabel: "redTriangleKey");
  GlobalKey whiteTriangleKey = GlobalKey(debugLabel: "whiteTriangleKey");
  GlobalKey greenTriangleKey = GlobalKey(debugLabel: "greenTriangleKey");

  Triangle redTriangle;
  Triangle whiteTriangle;
  Triangle greenTriangle;

  double textScale;

  void navigateToOneLight(context, color) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OneLightPage(color)),
    );
  }

  void initTriangles() {
    var red = getRect(redTriangleKey);
    redTriangle = Triangle(Point(red.left, red.top), Point(red.right, red.top),
        Point(red.bottomCenter.dx, red.bottom));

    debugPrint("red:$redTriangle");

    var white = getRect(whiteTriangleKey);
    whiteTriangle = Triangle(Point(white.topCenter.dx, white.top),
        Point(white.right, white.bottom), Point(white.left, white.bottom));

    debugPrint("white:$whiteTriangle");

    var green = getRect(greenTriangleKey);
    greenTriangle = Triangle(
        Point(green.left, green.top),
        Point(green.right, green.top),
        Point(green.bottomCenter.dx, green.bottom));

    debugPrint("green:$greenTriangle");
  }

  void handleClick(context, Offset offset) {
    // because the wight is triangle and overlay
    // so we need calculate the point to know which box is clicked
    if (redTriangle == null) {
      initTriangles();
    }

    var p = Point(offset.dx, offset.dy);

    debugPrint("p=$p");

    if (pointInTriangle(p, redTriangle)) {
      debugPrint("click red");
      navigateToOneLight(context, AppColors.red);
    } else if (pointInTriangle(p, whiteTriangle)) {
      debugPrint("click white");
      navigateToOneLight(context, Colors.white);
    } else if (pointInTriangle(p, greenTriangle)) {
      debugPrint("click green");
      navigateToOneLight(context, AppColors.green);
    } else {
      debugPrint("click none");
    }
  }

  Widget generateLights(BuildContext context, BoxConstraints box) {
    var size = MediaQuery.of(context).size;
    var isHorizontal = size.width > size.height;

    var boxWidth;
    var boxHeight;
    var boxMargin;
    if (isHorizontal) {
      // size from height
      boxHeight = box.maxHeight - 50; // 60 is text
      boxWidth = boxHeight * 1.169;
      boxMargin = box.maxWidth / 5.0;
    } else {
      // size from width
      if (size.height / size.width < 1.4) {
        // for pad, like 4:3
        boxWidth = size.width / 3;
      } else {
        // for phone
        boxWidth = size.width / 2.6;
      }

      boxHeight = boxWidth * 1.169;
      boxMargin = box.maxWidth / 2.0 - boxWidth - 15;
    }

    return Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topLeft,
        children: [
      Positioned(
          left: boxMargin,
          child: Column(
            children: [
              SizedBox(
                    height: 25.0,
                child: Text(
                  "Port",
                      style: TextStyle(fontSize: 16.0, color: AppColors.grey),
                ),
              ),
                  SvgPicture.asset("assets/images/redTriangle.svg",
                      key: redTriangleKey, width: boxWidth, height: boxHeight),
                  SizedBox(height: 25.0)
            ],
          )),
      Positioned(
        child: Column(children: [
              SizedBox(height: 25.0),
              SvgPicture.asset("assets/images/whiteTriangle.svg",
                  key: whiteTriangleKey, width: boxWidth, height: boxHeight),
          SizedBox(
                height: 25.0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Stern",
                    style: TextStyle(fontSize: 16.0, color: AppColors.grey),
              ),
            ),
          )
        ]),
      ),
      Positioned(
        right: boxMargin,
        child: Column(
          children: [
            SizedBox(
                  height: 25.0,
              child: Text(
                "Starboard",
                    style: TextStyle(fontSize: 16.0, color: AppColors.grey),
              ),
            ),
                SvgPicture.asset("assets/images/greenTriangle.svg",
                    key: greenTriangleKey, width: boxWidth, height: boxHeight),
                SizedBox(height: 25.0)
          ],
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    this.textScale = getTextScale(context);

    var body = Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16.0),
              child: Text("Tap a color to activate the corresponding lights",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32.0 * textScale,
                      color: AppColors.dark,
                      fontFamily: "AzoSansUber")),
            )),
        Expanded(
            flex: 2,
            child: GestureDetector(
                onTapUp: (detail) {
                  handleClick(context, detail.globalPosition);
                },
                child: LayoutBuilder(builder: generateLights))),
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(16.0),
              child: Text(
                  "This app is not a replacement for certified navigation lights. You should always check your running lights on aircraft, ships, and spacecraft, and always carry spares. This app DOES NOT meet 33 CFR 183.810 - Navigation light certification requirements and is NOT US Coast Guard Approved.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0 * textScale, color: AppColors.grey)),
            ))
      ],
    );

    return Scaffold(body: SafeArea(child: body));
  }
}

// reference https://github.com/mattdesl/point-in-triangle/blob/master/index.js
bool pointInTriangle(Point point, Triangle triangle) {
  //compute vectors & dot products
  var cx = point.x,
      cy = point.y,
      t0 = triangle.a,
      t1 = triangle.b,
      t2 = triangle.c,
      v0x = t2.x - t0.x,
      v0y = t2.y - t0.y,
      v1x = t1.x - t0.x,
      v1y = t1.y - t0.y,
      v2x = cx - t0.x,
      v2y = cy - t0.y,
      dot00 = v0x * v0x + v0y * v0y,
      dot01 = v0x * v1x + v0y * v1y,
      dot02 = v0x * v2x + v0y * v2y,
      dot11 = v1x * v1x + v1y * v1y,
      dot12 = v1x * v2x + v1y * v2y;

  // Compute barycentric coordinates
  var b = (dot00 * dot11 - dot01 * dot01),
      inv = b == 0 ? 0 : (1 / b),
      u = (dot11 * dot02 - dot01 * dot12) * inv,
      v = (dot00 * dot12 - dot01 * dot02) * inv;

  return u >= 0 && v >= 0 && (u + v < 1);
}
