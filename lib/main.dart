import 'package:flutter/material.dart';
import 'package:practica1/screens/dashboard_screen.dart';
import 'package:practica1/screens/list_task_screen.dart';
import 'package:practica1/screens/login_screen.dart';
import 'package:practica1/screens/splash_screens.dart';
import 'package:practica1/screens/taskScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.brown,

        //alfa transparencia
      ),
      home: const SplashScreen(),
      routes: {
        //alias / asi se definen rutas y son globales
        '/dash' :(BuildContext) => DashboardScreen(),
        '/login' :(BuildContext) => LoginScreen(),
        '/task' :(BuildContext) => ListTaskScreen(),
        '/add' :(BuildContext) => TaskScreen(),
      },
    );
  }
}

