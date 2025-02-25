

import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get bottomPadding => MediaQuery.of(this).viewPadding.bottom;

  double getHeight({required double givenHeight}){
    return height*givenHeight/852;
  }
  double getWidth({required double givenWidth}){
    return width*givenWidth/393;
  }
}
