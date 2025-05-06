import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/screens/Home.dart';

import '../widgets/campo_texto.dart';
class Loginscreen extends StatelessWidget {
  Loginscreen({super.key,});

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F0FB),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 50),
              //Logo APP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.confirmation_num,
                    color: Color.fromARGB(255, 141, 60, 155),
                    size: 32,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'W&S Ticket',
                    style: TextStyle(
                    fontFamily: 'Roboto', 
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 141, 60, 155),
                    letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              //Contenedor del login
              Container(
                  decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 5.0),
                      blurRadius: 5.0
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  ),
                padding: EdgeInsets.all(15),
                height: 500,
                width: 350,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('BIENVENIDOS',
                    style: TextStyle(
                      fontFamily: 'bold',
                      color: Colors.black,
                      fontSize: 28
                    ),
                    ),
                    SizedBox(height: 10,),
                    Text('Inicia sesion para administrar tus tickets',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    //Campos para llenar
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Email')),
                    CampoTexto(
                      controller: emailcontroller, 
                      hintText: 'you@example.com', 
                      obscureText: false),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Contraseña')),
                    CampoTexto(
                      controller: passwordcontroller, 
                      hintText: '', 
                      obscureText: true),
                      TextButton(onPressed: (){},
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Olvidaste tu contraseña?',
                          ),
                      )),
                      SizedBox(height: 10),
                      FilledButton(onPressed: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Homepage()));
                      },
                        child: const Text('Iniciar sesion')
                        ),
                      SizedBox(height: 5),
                      Divider(
                        color: Color(0xFFF1F0FB),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('No tienes una cuenta?'),
                          TextButton(onPressed: (){},
                            child: Text('Crea una cuenta')),
                        ],
                      ),
                      Divider(
                        color: Color(0xFFF1F0FB),
                      ),
                    ],
                    
                  ),

                ),
              ],
            ),
          )
        ),
      );
  }
}