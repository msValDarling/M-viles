

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super (key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  var contador =0;
 @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stateless vs Stateful',
      style: TextStyle(color: Color.fromARGB(255, 15, 1, 1)),
      ),
      ),
      body: Center(
        child: Text(
          'Contador $contador',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          contador++;
          print(contador);
          setState(() {
            
          });
        },
        child: Icon( Icons.fingerprint, ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, //mueve al centro de la pantalla
    );
  }
}
