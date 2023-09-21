import 'package:colorify/presentation/home/home_view.dart';
import 'package:colorify/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String homeRoute = "home";
}

class AppRouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoute.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppString.noRoute),
        ),
        body: const Center(
          child: Text(AppString.noRouteFound),
        ),
      )
    );
  }

}
