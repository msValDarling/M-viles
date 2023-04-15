import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:pmsna/provider/theme_provider.dart';
import 'package:pmsna/settings/styles_settings.dart';
import 'package:provider/provider.dart';

import 'list_post.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    Theme_provider Theme = Provider.of<Theme_provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Lince Tec :)')),
      ),
      body: ListPost(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((value) {
            setState(() {});
          });
        },
        label: Text('Add Post'),
        icon: const Icon(Icons.add_comment),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/OIP.p00mBRcv6JocCIzhC1e3-QHaHa?pid=ImgDet&rs=1'),
                ),
                accountName: Text('Valeria Teresita Ramos Carreño'),
                accountEmail: Text('18031648@itcelaya.edu.mx')),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              title: const Text('Registrarse'),
              subtitle: const Text('Registro de usuario'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/list');
              },
              title: const Text('Post'),
              subtitle: const Text('Registro de Post'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/onboarding');
              },
              title: const Text('Onboarding'),
              subtitle: const Text('Presentación de la app :)'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/theme');
              },
              title: const Text('Apariencia'),
              subtitle: const Text('Descubre los temas nuevos!'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/events');
              },
              title: const Text('LinceEvents'),
              subtitle:
                  const Text('Sorpréndete con nuestros nuevos LinceEventos!'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/popular'),
              title: const Text('Popular Movie'),
              subtitle: const Text(
                  ' Descubre las peliculas de tendencia que puedes ver en CineLince!'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, '/login');
              },
              title: const Text('Cerrar sesión'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_right),
            ),
            DayNightSwitcher(
              isDarkModeEnabled: isDarkModeEnabled,
              onStateChanged: (isDarkModeEnabled) {
                isDarkModeEnabled
                    ? Theme.setthemeData(StyleSettings.darkTheme(context))
                    : Theme.setthemeData(StyleSettings.lightTheme(context));
                this.isDarkModeEnabled = isDarkModeEnabled;
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
