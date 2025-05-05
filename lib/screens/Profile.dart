import 'package:flutter/material.dart';

class Porfilepagina extends StatelessWidget {
  const Porfilepagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}