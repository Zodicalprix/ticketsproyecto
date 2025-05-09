import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/screens/Home.dart';
import 'package:ticketsproyecto/src/screens/Recuperar_password.dart';
import 'package:ticketsproyecto/src/screens/Register.dart';
import 'package:ticketsproyecto/src/service/push_notification.dart';
import 'package:ticketsproyecto/src/widgets/botones_icons.dart';

import '../widgets/campo_texto.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();



  static String? token;

  @override
  void initState(){
    super.initState();
    token = PushNotificationService.token;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F0FB),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, right: 20, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.login, color: Color(0xFF2A3A5B)),
                SizedBox(width: 15),
                Text('LOGIN', style: TextStyle(fontSize: 30)),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF2A3A5B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    topRight: Radius.circular(200),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 80,
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.confirmation_num,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'W&S Tickets',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          CampoTexto(
                            controller: emailcontroller,
                            hintText: 'Email@example.com',
                            obscureText: false,
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Contraseña',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          CampoTexto(
                            controller: passwordcontroller,
                            hintText: '',
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: ButtonStyle(),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecuperarPassword(),
                                ),
                              );
                            },
                            child: Text(
                              'Olvidaste tu contraseña?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BotonPre(
                          Navegador: Homepage(),
                          textoBoton: 'Iniciar sesion',
                        ),
                        SizedBox(width: 20),
                        BotonPre(
                          Navegador: Registerpagina(),
                          textoBoton: 'Registrar',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




