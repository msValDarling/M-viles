import 'package:flutter/material.dart';
import 'package:practica1/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DatabaseHelper? _database;
  @override
  void initState() {
    // TODO: implement initState
    _database = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController txtFecha = TextEditingController();
    TextEditingController txtDesc = TextEditingController();
    final txtFechaEnt = TextField(
      controller: txtFecha,
    );
    final txtDescTask = TextField(
      controller: txtDesc,
      maxLines: 8,
    );
    final btnGuardar = ElevatedButton(
      onPressed: () {
        _database!.insertar({
          'dscTarea': txtDesc.text,
          'fechaEnt': txtFecha.text,
        }, 'tblTareas');
      },
      child: Text('Guardar'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: ListView(
        children: [
          txtFechaEnt,
          txtDescTask,
          btnGuardar,
        ],
      ),
    );
  }
}
