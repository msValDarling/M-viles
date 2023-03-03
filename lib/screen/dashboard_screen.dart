import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:pmsna/provider/theme_provider.dart';
import 'package:pmsna/settings/styles_settings.dart';
import 'package:provider/provider.dart';

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
              title: const Text('Practica 1'),
              subtitle: const Text(
                  'Register Screen: Widget móvil: Registro de usuario'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: () {},
              title: const Text('Practica 2'),
              subtitle: const Text(
                  'Login Responsive: Widget web: Registro de usuario'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: () {},
              title: const Text('Practica 3'),
              subtitle: const Text('Onboarding: Presentación de la app'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_right),
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
