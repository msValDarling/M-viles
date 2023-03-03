import 'package:flutter/material.dart';
import 'package:pmsna/screen/dashboard_screen.dart';
import 'package:pmsna/screen/login_screen.dart';
import 'package:pmsna/screen/register_screen.dart';
import 'package:pmsna/screen/splash_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => const RegisterScreen(),
    '/dash': (BuildContext context) => DashboardScreen(),
    '/splash': (BuildContext context) => SplashScreen(),
    '/login': (BuildContext context) => LoginScreen(),
  };
}
