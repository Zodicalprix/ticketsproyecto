import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ticketsproyecto/firebase_options.dart';
import 'package:ticketsproyecto/src/routes/app_routes.dart';
import 'package:ticketsproyecto/src/routes/routes.dart';
import 'src/screens/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tickets APP',
      initialRoute: Routes.authlayout,
      routes: appRoutes,
      );
  }
}




