import 'package:flutter/material.dart';

// تم عملة جلوبل حتى يسمع فى جميع الصفحات

ScrollController scrollController = ScrollController();

class ScrollListener extends ChangeNotifier {
  double bottom = 0;
  double _last = 0;

  ScrollListener.initialise(ScrollController controller,
      [double height = 100]) {
    controller.addListener(() {
      double current = controller.offset;
      print("current" + current.toString());
      print("userScrollDirection =" +
          controller.position.userScrollDirection.toString());

      bottom += _last - (current);
      print("bottom" + bottom.toString());
      print("- height = " + (-height).toString());

      if (bottom < 0) {
        bottom = -height;
        // bottom -= 20;
        print("انا نازل");
      }
      // if (current == 0.0) {
      //   bottom = 0;
      //   print("$bottom");
      // }
      if (controller.position.userScrollDirection.toString() ==
          "ScrollDirection.forward") {
        current = 0;
        bottom = 0;
      }
      _last = current;
      if (bottom <= 0 && bottom >= -height) {
        //  print("bottom bf");
        //  print(bottom);
        //   print("bottom af");
        //  bottom -= 100;
        //    print(bottom);

        notifyListeners();
      }
    });
  }
}
