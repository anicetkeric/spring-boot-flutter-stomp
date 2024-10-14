import 'package:airport_gate/core/router/route_constants.dart';
import 'package:airport_gate/views/gate_screen.dart';
import 'package:airport_gate/views/splash_screen.dart';
import 'package:flutter/material.dart';

import 'route_exception.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {
      case RouteConstants.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RouteConstants.gate:
        return MaterialPageRoute(
            builder: (_) => const GateScreen());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
