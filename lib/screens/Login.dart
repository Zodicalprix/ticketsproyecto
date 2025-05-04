import 'package:flutter/material.dart';

import '../widgets/campo_texto.dart';
class Loginscreen extends StatelessWidget {
  Loginscreen({super.key,});

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 50),
              //Logo APP
              Text(
                'W&S Ticket',
                style: TextStyle(
                  fontFamily: 'bold',
                  fontSize: 30,
                  color: const Color.fromARGB(255, 141, 60, 155)
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //Contenedor del login
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  ),
                padding: EdgeInsets.all(15),
                height: 500,
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('BIENVENIDOS',
                    style: TextStyle(
                      fontFamily: 'bold',
                      color: Colors.black,
                      fontSize: 28
                    ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Inicia secion para administrar tus tickets',
                    style: TextStyle(
                      color: Colors.grey[600]
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    //Campos para llenar
                    CampoTexto(
                      controller: emailcontroller, 
                      hintText: 'Correo', 
                      obscureText: false),
                    SizedBox(height: 10,),
                    CampoTexto(
                      controller: passwordcontroller, 
                      hintText: 'Contraseña', 
                      obscureText: true),
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