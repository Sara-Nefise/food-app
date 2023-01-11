import 'package:flutter/material.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/screens/refigerator_screen.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.home:
        return normalNavigate(RefigeratorScreen(), NavigationConstants.home);
      // case NavigationConstants.SIGNUP2:
      //   return normalNavigate(
      //       SignupSecondPage(user: args.arguments as UserObject),
      //       NavigationConstants.SIGNUP2);
      default:
        return MaterialPageRoute<void>(
          builder: (context) => RefigeratorScreen(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute<void>(
        builder: (context) => widget, settings: RouteSettings(name: pageName));
  }
}

class NavigationConstants {
  static const home = '/';
  static const ONBOARDING = '/onboarding';
}
