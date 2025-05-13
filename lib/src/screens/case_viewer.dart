import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CasoView extends StatefulWidget {
  const CasoView({super.key});

  @override
  State<CasoView> createState() => _CasoViewState();
}

class _CasoViewState extends State<CasoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F0FB),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFFF1F0FB),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Detalles del Caso',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Aquí van los detalles del caso seleccionado.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      )),
    );
  }
}