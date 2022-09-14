import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:practica1/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtConUser = TextEditingController();
  TextEditingController txtConPwd = TextEditingController();

  bool valuefirst = false;
  Future<void> sesionActive() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ban', true);
    Navigator.pushNamed(context, '/dash');
    txtConUser.clear();
    txtConPwd.clear();
    valuefirst = false;
  }

  @override
  Widget build(BuildContext context) {
    //cajas de textos --------------------------------------------------------------------
    final txtUser = TextField(
      controller: txtConUser,
      decoration: InputDecoration(
          hintText: 'Introduce el usuario', label: Text('Correo Electronico')),
    );

//onChanged:(value){}, buscar
    final txtpwd = TextField(
      controller: txtConPwd,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Introduce la contraseña', label: Text('Contraseña')),
    );
    //-----------------------------------------------------------------------------------
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/fondo.png'),
              fit: BoxFit.cover,
            )),
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              child: Image.asset(
            'assets/rana.png',
          )),
          Container(
            color: Color.fromARGB(255, 245, 191, 129),
            child: ListView(
              shrinkWrap: true,
              //sliverlist la barra que entre mas abajo mas pequeña se hace
              children: [
                txtUser,
                SizedBox(
                  height: 10,
                ),
                txtpwd,
                Checkbox(
                  checkColor: Colors.greenAccent,
                  activeColor: Colors.redAccent,
                  value: valuefirst,
                          onChanged: (value) {
                            setState(() {
                              valuefirst = value!;
                            }); }
                ),
                Text('Mantener inicio de sesión.'),
              ],
            ),
          ),
          Positioned(
            //posicion del pergamino
            right: MediaQuery.of(context).size.width / 20,
            //left: MediaQuery.of(context).size.width / 5,
            top: MediaQuery.of(context).size.width / 1,
            child: GestureDetector(
              onTap: () {
                print('Valor de la caja ${txtConUser.text}');
                  if ((txtConPwd.text.isNotEmpty) &&
                      (txtConUser.text.isNotEmpty)) {
                    if ((txtConUser.text == 'valeria XD') &&
                        (txtConPwd.text == '123')) {
                      if ((valuefirst == true)) {
                        sesionActive();
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Active el checkbox para mantener sesión'),
                              );
                              //sesionActive();
                            });
                      }
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: Text('ERROR INICIO SESIÓN'),
                                content: SingleChildScrollView(
                                  child: ListBody(children: [
                                    Text(
                                        'El usuario o la contraseña que se está ingresando es incorrecto'),
                                  ]),
                                ));
                          });
                    }
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('ERROR INICIO SESIÓN'),
                              content: SingleChildScrollView(
                                child: ListBody(children: [
                                  Text(
                                      'Debes rellenar usuario y contraseña para continuar'),
                                ]),
                              ));
                        });
                  }
              },
              child: Image.asset(
                'assets/bloque.png',
                height: MediaQuery.of(context).size.width / 10,
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width / 50,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 10,
              ),
              width: MediaQuery.of(context).size.width / 1.2,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SocialLoginButton(
                      buttonType: SocialLoginButtonType.facebook,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const SizedBox(height: 5),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.github,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 5,
                  ),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.google,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
