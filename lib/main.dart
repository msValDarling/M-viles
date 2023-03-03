import 'package:flutter/material.dart';
import 'package:pmsna/provider/theme_provider.dart';
import 'package:pmsna/routes.dart';
import 'package:pmsna/screen/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Theme_provider(context)),
      ],
      child: PMSNApp(),
    );
  }
}

class PMSNApp extends StatelessWidget {
  const PMSNApp({super.key});

  @override
  Widget build(BuildContext context) {
    Theme_provider theme = Provider.of<Theme_provider>(context);
    return MaterialApp(
      theme: theme.getthemeData(),
      routes: getApplicationRoutes(),
      home: LoginScreen(),
    );
  }
}
