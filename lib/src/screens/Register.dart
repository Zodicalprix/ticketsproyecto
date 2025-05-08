import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/screens/Login.dart';
import 'package:ticketsproyecto/src/screens/Recuperar_password.dart';
import 'package:ticketsproyecto/src/widgets/campo_texto.dart';

class Registerpagina extends StatelessWidget {
  Registerpagina({super.key});

  final nombrecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final regionalcontroller = TextEditingController();
  final cargocontroller = TextEditingController();
  final edadcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F0FB),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200),
                  ),
                  color: Color(0xFF2A3A5B),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60,),
                      CampoTexto(
                        controller: emailcontroller,
                        hintText: 'Email',
                        obscureText: false,
                      ),
                      SizedBox(height: 30,),
                      CampoTexto(
                        controller: nombrecontroller,
                        hintText: 'Nombre',
                        obscureText: false,
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Expanded(
                            child: CampoTexto(
                              controller: regionalcontroller,
                              hintText: 'Regional',
                              obscureText: false,
                            ),
                          ),
                          SizedBox(width: 10), 
                          Expanded(
                            child: CampoTexto(
                              controller: edadcontroller,
                              hintText: 'Edad',
                              obscureText: false,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      CampoTexto(
                        controller: passwordcontroller,
                        hintText: 'Contraseña',
                        obscureText: false,
                      ),
                      SizedBox(height: 30,),
                      CampoTexto(
                        controller: confpasswordcontroller,
                        hintText: 'Confirmar contraseña',
                        obscureText: false,
                      ),
                      SizedBox(height: 80,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.confirmation_num,
                            color: Colors.white,
                            size: 40,),
                            SizedBox(
                              width: 5,
                            ),
                          Text(
                            'W&S Tickets',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30
                            ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loginscreen()),
                    );
                  },
                  child: Text(
                    'REGISTRAR',
                    style: TextStyle(color: Color(0xFF161927), fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
