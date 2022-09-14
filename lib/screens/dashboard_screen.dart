import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: Colors.greenAccent,
        //en vez de lo de arriba puede ser una imagen XD
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/originals/f6/5f/64/f65f64ad34449adac3a05a550a9d9078.jpg',
                  ),
                ),
                accountName: Text(
                  'Rubencin XDXD jwjwjsjsjjssjj',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                accountEmail: Text(
                  'ruben.torres@itcelaya.edu.mx',
                  style: TextStyle(color: Colors.black),
                )),
            ListTile(
              leading: Image.asset('assets/item.png'),
              trailing: Icon(Icons.chevron_right),
              title: Text('Practica 1'),
              onTap: () {
                //Navigator.popUntil(context, ModalRoute.withName('/login'));
              },
            ),

ListTile(
              leading: Image.asset('assets/item.png'),
              trailing: Icon(Icons.chevron_right),
              title: Text('Base de datos'),
              onTap: () {
                Navigator.pushNamed(context, '/task');
              },
            ),

            ListTile(
              leading: Image.asset('assets/item.png'),
              trailing: Icon(Icons.chevron_right),
              title: Text('Cerrar sesion'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
