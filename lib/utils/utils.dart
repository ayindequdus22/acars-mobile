import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

var screen = PlatformDispatcher.instance.views.first.physicalSize /
    PlatformDispatcher.instance.views.first.devicePixelRatio;

int currentTab = 1;

double setWidth(double w) {
  double width = ((screen.width).toInt() / 430) * w;
  dynamic tw = width.toInt();
  width = tw.toDouble();
  return width;
}

double setHeight(double h) {
  double appb = AppBar().preferredSize.height;
  dynamic pixel = ((screen.height).toInt() - appb) / 932;
  dynamic th = (pixel * h).toInt();
  double height = th.toDouble();
  return height;
}

void screenHeightWidth() {
  if(kDebugMode){
      print("Screen height :: ${screen.height}");
     print("Screen width :: ${screen.width}");
  }

}
