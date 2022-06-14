import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrientationHelper {
  // static bool isWeb() {
  //   try {
  //     if (Platform.isAndroid || Platform.isIOS) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //   }
  // }

  static bool isVertical() => SizerUtil.orientation == Orientation.portrait;
}
