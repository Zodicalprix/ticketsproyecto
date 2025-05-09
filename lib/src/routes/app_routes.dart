import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/routes/routes.dart';
import 'package:ticketsproyecto/src/screens/CrearTickets.dart';
import 'package:ticketsproyecto/src/screens/Dashboard.dart';
import 'package:ticketsproyecto/src/screens/Home.dart';
import 'package:ticketsproyecto/src/screens/Login.dart';
import 'package:ticketsproyecto/src/screens/Profile.dart';
import 'package:ticketsproyecto/src/screens/Register.dart';


Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.login: (_) => Loginscreen(),
  Routes.register: (_) => Registerpagina(),
  Routes.creartickets: (_) => Creartickets(),
  Routes.dashboard: (_) => Dashboard(),
  Routes.profile: (_) => Porfilepagina(),
  Routes.home: (_) => Homepage(),
};