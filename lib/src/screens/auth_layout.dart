import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/routes/routes.dart';
import 'package:ticketsproyecto/src/screens/Login.dart';
import 'package:ticketsproyecto/src/service/auth_service.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    this.pageItNotConnected,
  });

  final Widget? pageItNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder
    (
      valueListenable: authService,
      builder: (context, authService, child){
        return StreamBuilder(
          stream: authService.authStateChanges, 
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            else if(snapshot.hasData){
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, Routes.home);
              });
              return const SizedBox(); 
            }else{
              return pageItNotConnected ?? const Loginscreen();
            }
          }
        );
      }

    );
  }
}