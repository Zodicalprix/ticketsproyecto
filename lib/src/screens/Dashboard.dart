import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/screens/Profile.dart';
import 'package:ticketsproyecto/src/screens/case_viewer.dart';
import 'package:ticketsproyecto/src/service/datos_service.dart';
import 'package:ticketsproyecto/src/widgets/drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F0FB),
      appBar: AppBar(
        leading: IconDrawer(),
        backgroundColor: Color(0xFF2A3A5B),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('DASHBOARD', style: TextStyle(color: Colors.white)),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Porfilepagina(),
                  ),
                );
              },
              icon: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
      drawer: DrawerBase(),
      body: FutureBuilder<List<Map<String, String>>>(
        future: obtenerTickets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error al obtener tickets: ${snapshot.error}'),
            );
          } else {
            final datos = snapshot.data ?? [];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: datos.length,
                itemBuilder: (context, index) {
                  final item = datos[index];
                  return Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.circle,
                        color: getColorEstado(item['estado'] ?? ''),
                      ),
                      title: Text(item['motivo']!),
                      subtitle: Text(
                        item['descripcion']!,
                        style: TextStyle(color: Color(0xFF161927)),
                      ),
                      onTap: () {
                        final idDoc = item['id'];
                        if (idDoc != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => CasoView(idDocumento: idDoc),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
