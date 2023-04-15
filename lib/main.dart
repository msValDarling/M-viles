import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pmsna/provider/theme_provider.dart';
import 'package:pmsna/routes.dart';
import 'package:provider/provider.dart';
import 'package:pmsna/screen/onboarding.dart';

/* principal */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
//aqui se agrego el const quien sabe pq
//era recomendacion a ver si sale :c
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Theme_provider(context)),
      ],
      child: const PMSNApp(),
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
      home: //LoginScreen(),
          const Onboarding(),
    );
  }
}
