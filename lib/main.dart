import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text("TICKETw1"),
        ),
        body: Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
          
                },
                child: Text("Registrarse"),
              ),
              ElevatedButton(onPressed: () {
                
                }, child: Text("Iniciar"))
            ],
          ),
        ),
      );
  }
}


