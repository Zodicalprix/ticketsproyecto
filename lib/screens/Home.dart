import 'package:flutter/material.dart';
import 'package:ticketsproyecto/screens/Profile.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: (){
            Navigator.pop(context);
          },),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.confirmation_num,),
            SizedBox(width: 5),
            Text('W&S Tickets'),
            SizedBox(width: 10),
            Align(
              child: IconButton(onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Porfilepagina()));
              },
              icon: Icon(Icons.person)),
            )
          ],
        ),
      ),
    );
  }
}
