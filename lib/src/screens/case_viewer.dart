import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CasoView extends StatefulWidget {
  final String idDocumento;
  const CasoView({super.key, required this.idDocumento});

  @override
  State<CasoView> createState() => _CasoViewState();
}

Future<Map<String, dynamic>?> obtenerDetallesCaso(String idDocumento) async {
  await Future.delayed(const Duration(seconds: 2));
  try {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance
            .collection('tickets')
            .doc(idDocumento)
            .get();
    if (snapshot.exists) {
      return snapshot.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  } catch (e) {
    print('Error al obtener detalles del caso: $e');
    return null;
  }
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
      body: FutureBuilder<Map<String, dynamic>?>(
        future: obtenerDetallesCaso(widget.idDocumento),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error al obtener detalles del caso'),
            );
          } else {
            final data = snapshot.data;
            final Caso = data?['Caso'] ?? 'Información no disponible';
            final Regional = data?['regional'] ?? 'Información no disponible';
            final FechaCreacion =
                data?['fechaCreacion']?.toDate() ?? DateTime.now();
            final Motivo = data?['motivo'] ?? 'Información no disponible';
            final Descripcion =
                data?['descripcion'] ?? 'Información no disponible';
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Numero de Caso',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            Caso.toString(),
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A3A5B),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Motivo del Caso',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          Motivo,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A3A5B),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Descripcion del Caso',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        constraints: BoxConstraints(
                          minHeight:
                              MediaQuery.of(context).size.height *
                              0.5, 
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          Descripcion,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                FechaCreacion.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {}, 
                              child: Icon(Icons.edit,
                              color: Colors.white, size: 20),
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: const Color(0xFF2A3A5B),
                                padding: const EdgeInsets.all(10),
                              )
                              ,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
