import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/screens/CrearTickets.dart';
import 'package:ticketsproyecto/src/screens/Dashboard.dart';
import 'package:ticketsproyecto/src/screens/Profile.dart';
import '../widgets/botones_icons.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F0FB),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: true, // para que se muestre el ícono del Drawer
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.confirmation_num),
            SizedBox(width: 5),
            Text('W&S Tickets'),
            SizedBox(width: 10),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Porfilepagina()),
                );
              },
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF161927),
        child: ListView(
          
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
              leading: Icon(Icons.home,
              color: Colors.white),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text('Crear Ticket'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Creartickets()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: BotonCrear(),
      ),
    );
  }
}
