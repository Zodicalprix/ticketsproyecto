import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/routes/routes.dart';

import 'package:ticketsproyecto/src/service/auth_service.dart';
import 'package:ticketsproyecto/src/widgets/campo_texto.dart';

class Registerpagina extends StatefulWidget {
  Registerpagina({super.key});

  @override
  State<Registerpagina> createState() => _RegisterpaginaState();
}

class _RegisterpaginaState extends State<Registerpagina> {

  final _formKey = GlobalKey<FormState>();

  final nombrecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final regionalcontroller = TextEditingController();
  final cargocontroller = TextEditingController();
  final edadcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confpasswordcontroller = TextEditingController();


  @override
  void dispose() {
    nombrecontroller.dispose();
    emailcontroller.dispose();
    regionalcontroller.dispose();
    cargocontroller.dispose();
    edadcontroller.dispose();
    passwordcontroller.dispose();
    confpasswordcontroller.dispose();
    super.dispose();
  }

  void datosUser() async{
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'userId': user.uid,
        'Nombre': nombrecontroller.text,
        'Email': emailcontroller.text,
        'Regional': regionalcontroller.text,
        'Cargo': cargocontroller.text,
        'Edad': edadcontroller.text,
      });
      print('Datos de usuario guardados en Firestore');
    } else {
      print('No hay usuario autenticado');
    }
  }

  void register() async{
    try{
      await authService.value.createAccount(
      email: emailcontroller.text, 
      password: passwordcontroller.text,
      confpassword: confpasswordcontroller.text, 
      nombre: nombrecontroller.text, 
      regional: regionalcontroller.text, 
      cargo: cargocontroller.text, 
      edad: edadcontroller.text,
      );
      Navigator.pushNamed(context, Routes.login);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F0FB),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
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
                        SizedBox(height: 60),
                        CampoTexto(
                          controller: emailcontroller,
                          hintText: 'Email',
                          obscureText: false,
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Email requerido' : null,
                        ),
                        SizedBox(height: 30),
                        CampoTexto(
                          controller: nombrecontroller,
                          hintText: 'Nombre',
                          obscureText: false,
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Nombre requerido' : null,
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: CampoTexto(
                                controller: regionalcontroller,
                                hintText: 'Regional',
                                obscureText: false,
                                validator: (value) =>
                                    value == null || value.isEmpty ? 'Regional requerida' : null,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: CampoTexto(
                                controller: edadcontroller,
                                hintText: 'Edad',
                                obscureText: false,
                                validator: (value) =>
                                    value == null || value.isEmpty ? 'Edad requerida' : null,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        CampoTexto(
                          controller: cargocontroller,
                          hintText: 'Cargo',
                          obscureText: false,
                          validator: (value) =>
                              value == null || value.length < 6
                                  ? 'Cargo requerido'
                                  : null,
                        ),
                        SizedBox(height: 30),
                        CampoTexto(
                          controller: passwordcontroller,
                          hintText: 'Contraseña',
                          obscureText: true,
                          validator: (value) =>
                              value == null || value.length < 6
                                  ? 'Mínimo 6 caracteres'
                                  : null,
                        ),
                        SizedBox(height: 30),
                        CampoTexto(
                          controller: confpasswordcontroller,
                          hintText: 'Confirmar contraseña',
                          obscureText: true,
                          validator: (value) =>
                              value == null || value.isEmpty
                                  ? 'Confirma tu contraseña'
                                  : null,
                        ),
                        SizedBox(height: 120),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: TextButton(
                  onPressed: () async {
                    register();
                    datosUser();
                  },
                  child: Text(
                    'REGISTRAR',
                    style: TextStyle(color: Color(0xFF161927), fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
