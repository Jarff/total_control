import 'package:control_total/src/views/dashboard.dart';
import 'package:control_total/src/views/pages.dart';
import 'package:control_total/src/views/start.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/Start':
        return MaterialPageRoute(builder: (_) => const StartPage());
      case '/Pages':
        return MaterialPageRoute(builder: (_) => PagesWidget());
      case '/Dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardPageWidget());
      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: SafeArea(child: Text('RouteError'))));
    }
  }
}
