import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> navigateToReplacement(String routeName) {
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  // bool goBack() {
  //   navigatorKey.currentState.pop();
  // }
}
