import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/service/auth_service.dart';
import 'package:ticketsproyecto/src/widgets/botones_icons.dart';
import 'package:ticketsproyecto/src/widgets/campo_texto.dart';
import 'package:ticketsproyecto/src/widgets/snack_bar.dart';

class RecuperarPassword extends StatefulWidget {
  const RecuperarPassword({
    super.key,
    });

  @override
  State<RecuperarPassword> createState() => _RecuperarPasswordState();
}

class _RecuperarPasswordState extends State<RecuperarPassword> {
  TextEditingController emailcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  void resetPassword() async{
    try{
      await authService.value.resetPassword(
        email: emailcontroller.text,
      );
      showSnackBar(context, 'Enlace de recuperación enviado');
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A3A5B),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
          color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFF2A3A5B),
      resizeToAvoidBottomInset: true,
      // AppBar con un título y un icono de retroceso
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 110),
                const Text(
                  'Recuperar Contraseña',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Por favor, ingresa tu correo electrónico para recibir un enlace de restablecimiento de contraseña.',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 40),
                CampoTexto(
                  controller: emailcontroller,
                  hintText: 'Email',
                  obscureText: false,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Email requerido' : null,
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BotonFuncion(
                      textoBotonF: 'Enviar enlace de recuperación',
                      presionado: resetPassword),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
