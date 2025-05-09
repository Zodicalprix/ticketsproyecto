import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/screens/CrearTickets.dart';
import 'package:ticketsproyecto/src/screens/Dashboard.dart';
import 'package:ticketsproyecto/src/screens/Profile.dart';
import 'package:ticketsproyecto/src/widgets/drawer.dart';
import '../widgets/botones_icons.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F0FB),
      appBar: AppBar(
        leading: IconDrawer(),
        backgroundColor: Color(0xFF4B5B7C),
        automaticallyImplyLeading:
            true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'HOME',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
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
      body: Row(
        children: [
          // Lado izquierdo
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF4B5B7C),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Text("", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),

          // Lado derecho
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Text('BIENBENIDO', style: TextStyle(fontSize: 25)),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            'En la APP W&S Tickets podras crear y monitorear tus ticktes relacionados al area de tecnologia.',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const Creartickets(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    backgroundColor: Color(0xFF161927),
                                    textStyle: TextStyle(fontSize: 18),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Crear Ticket',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Dashboard(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    backgroundColor: Color(0xFF161927),
                                    textStyle: TextStyle(fontSize: 18),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.dashboard,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Ir al Dashboard',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

