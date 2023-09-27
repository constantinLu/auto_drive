import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

extension Teleporter on BuildContext {
  void push(PageRouteInfo route) {
    router.push(route);
  }

  void navigateBack() {
    router.back();
  }


  void replace(PageRouteInfo route) {
    router.replace(route);
  }
}
