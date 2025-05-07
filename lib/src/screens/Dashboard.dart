import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ticketsproyecto/src/screens/Profile.dart';
import 'package:ticketsproyecto/src/widgets/drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconDrawer(),
        backgroundColor: Color(0xFF4B5B7C),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.confirmation_num, color: Colors.white),
            SizedBox(width: 10),
            Text('W&S Tickets', style: TextStyle(color: Colors.white)),
            SizedBox(width: 45,),
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
      drawer: DrawerBase()
    );
  }
}
