import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/routes/routes.dart';
import 'package:ticketsproyecto/src/screens/Register.dart';
import 'package:ticketsproyecto/src/service/auth_service.dart';
import 'package:ticketsproyecto/src/widgets/botones_icons.dart';
import '../widgets/campo_texto.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  void signIn() async {
    try {
      await authService.value.signIn(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      Navigator.of(context).pushReplacementNamed('/home');
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2A3A5B),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 135),

                Icon(Icons.confirmation_num, color: Colors.white, size: 80),
                SizedBox(height: 15),
                Text(
                  'W&S Tickets',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
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
                        validator: (value) {
                          return null;
                        },
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
                        validator: (value) {
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.recuperarpassword);
                  },
                  child: Text(
                    'Olvidaste tu contraseña?',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          Color(0xFF161927),
                        ),
                        padding: WidgetStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: signIn,
                      child: Text('Iniciar sesión',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                    ),
                    SizedBox(width: 20),
                    BotonPre(
                      Navegador: Registerpagina(),
                      textoBoton: 'Registrar',
                    ),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
