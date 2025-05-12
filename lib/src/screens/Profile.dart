
import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/widgets/textos_fijos.dart';

import '../widgets/clipper_ola.dart';

class Porfilepagina extends StatelessWidget {
  const Porfilepagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F0FB),
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 300,
              color: Color(0xFF2A3A5B),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      ),
                    SizedBox(width: 5),
                    Text(
                      'Perfil',
                      style: TextStyle(
                        color: Colors.white
                      ),),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 220,
            left: MediaQuery.of(context).size.width / 2 - 75,
            child: ClipOval(
              child: Image.network(
                'https://img.freepik.com/vector-premium/estilo-contorno-icono-vectorial-usuario-aislado-fondo-blanco-aplicacion-movil-logotipo-sitio-web-ui-simbolo-humano-hombre-silueta-signo-miembro-social-signo-perfil-personal-10-eps_824631-3088.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    height: 50,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Información del usuario",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 440),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  TextosProfile(textoFinalP: 'Santiago Lopez Arteaga', textoInicialP: 'Nombre'),
                  SizedBox(height: 10,),
                  TextosProfile(textoInicialP: 'Email', textoFinalP: 'Lopezarteaga.13@gmail.com'),
                  SizedBox(height: 10,),
                  TextosProfile(textoInicialP: 'Regional', textoFinalP: 'SUR'),
                  SizedBox(height: 10,),
                  TextosProfile(textoInicialP: 'Cargo', textoFinalP: 'Practicante sistemas'),
                  SizedBox(height: 10,),
                  TextosProfile(textoInicialP: 'Edad', textoFinalP: '23'),
                  SizedBox(height: 10,),
                  TextosProfile(textoInicialP: 'Genero', textoFinalP: 'Masculino'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
