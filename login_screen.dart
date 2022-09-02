import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final txtUser = TextField(
    decoration: InputDecoration(
      hintText: 'Introduce el usuario', label: Text('Correo Electronico')),
  );

   final txtpwd = TextField(
    obscureText: true,
    decoration: InputDecoration(
     hintText: 'Introduce la contraseña', label: Text('Contraseña')),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
            image: DecorationImage(image: AssetImage('assets/fondo.png'))),
        child: Stack(children: [
          Container(
            child: ListView(
              shrinkWrap: true,
              //sliverlist la barra que entre mas abajo mas pequeña se hace
              children: [txtUser, txtpwd],
            ),
          ),
        ]),
      ),
    );
  }
}
