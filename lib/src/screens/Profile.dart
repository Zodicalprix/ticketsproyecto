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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple,Colors.cyanAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                )
              ),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.person_2),
                    SizedBox(width: 5),
                    Text('Perfil'),
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
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                spacing: 8,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text("Información del usuario", 
                    style: TextStyle(fontSize: 20)),
                  ),
                  Divider(),
                  SizedBox(height: 30,),
                  TextoProfile(
                    textoInicio: 'Nombre: ',
                    textoFinal: 'Santiago Lopez Arteaga',
                  ),
                  TextoProfile(
                    textoInicio: 'Email: ', 
                    textoFinal: 'Lopezarteaga@d1.com.co'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextoProfile(
                        textoFinal: '22',
                        textoInicio: 'Edad: ',),
                      SizedBox(width: 15,),
                      TextoProfile(
                        textoInicio: 'Regional: ', 
                        textoFinal: 'SUR')
                    ],
                  ),
                  TextoProfile(
                    textoInicio: 'Cargo: ',
                    textoFinal: 'Practicante de sistemas')
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                ),
                gradient: LinearGradient(
                  colors: [Colors.deepPurple,Colors.cyanAccent]),
              ),
            ),
          )
        ],
      ),
      
    );
  }
}


