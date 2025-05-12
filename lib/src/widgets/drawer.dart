import 'package:flutter/material.dart';

import 'package:ticketsproyecto/src/screens/CrearTickets.dart';
import 'package:ticketsproyecto/src/screens/Dashboard.dart';
import 'package:ticketsproyecto/src/screens/Home.dart';
import 'package:ticketsproyecto/src/screens/Login.dart';


class DrawerBase extends StatelessWidget {
  const DrawerBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFF1F0FB),
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF2A3A5B)),
                child: Text(
                  'Menú de Navegación',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Color(0xFF161927)),
                title: Text('Home', style: TextStyle(color: Color(0xFF161927))),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.add_circle_outline,
                  color: Color(0xFF161927),
                ),
                title: Text(
                  'Crear Ticket',
                  style: TextStyle(color: Color(0xFF161927)),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Creartickets()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.dashboard, color: Color(0xFF161927)),
                title: Text(
                  'Dashboard',
                  style: TextStyle(color: Color(0xFF161927)),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  Dashboard()
                    ),
                  );
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF161927),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loginscreen(),
                    ));
                },
                icon: Icon(Icons.logout, color: Colors.white),
                label: Text(
                  'Cerrar sesión',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconDrawer extends StatelessWidget {
  const IconDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu, color: Colors.white),
        );
      },
    );
  }
}
