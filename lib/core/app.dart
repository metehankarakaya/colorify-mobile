import 'package:colorify/core/route_manager.dart';
import 'package:colorify/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouteGenerator.getRoute,
      initialRoute: AppRoute.homeRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: AppColor.green700)
      ),
    );
  }
}
