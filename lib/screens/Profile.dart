import 'package:flutter/material.dart';

class Porfilepagina extends StatelessWidget {
  const Porfilepagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F0FB),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.person_2,),
            SizedBox(width: 5),
            Text('Perfil'),
            SizedBox(width: 10),
          ]
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100)
          )
        ),
        child: Column(
          children: [
            ClipOval(
              child: 
                Image.network(
                'https://img.freepik.com/vector-premium/estilo-contorno-icono-vectorial-usuario-aislado-fondo-blanco-aplicacion-movil-logotipo-sitio-web-ui-simbolo-humano-hombre-silueta-signo-miembro-social-signo-perfil-personal-10-eps_824631-3088.jpg',
                width: 300,
                height: 300,
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 5.0),
                      blurRadius: 5.0
                    )
                  ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Información'),
                    Divider(),
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}