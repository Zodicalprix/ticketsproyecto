import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ticketsproyecto/src/screens/Profile.dart';
import 'package:ticketsproyecto/src/widgets/drawer.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

    final List<Map<String, String>> datos = [
    {'titulo': 'Card 1', 'descripcion': 'Descripción 1'},
    {'titulo': 'Card 2', 'descripcion': 'Descripción 2'},
    {'titulo': 'Card 3', 'descripcion': 'Descripción 3'},
    // ... más datos desde la base
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconDrawer(),
        backgroundColor: Color(0xFF4B5B7C),
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
              icon: Icon(
                Icons.person,
                color: Colors.white,
                ),
            ),
          ],
        ),
      ),
      drawer: DrawerBase(),
      body: Padding(
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
              leading: Icon(Icons.info, color: Color(0xFF6E8FAF)),
              title: Text(item['titulo']!),
              subtitle: Text(item['descripcion']!),
              onTap: () {
                // Acción al tocar
              },
            ),
          );
        },
      ),
    )
    );
  }
}
