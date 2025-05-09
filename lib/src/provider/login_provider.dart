import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthStatus {notAuthentication, chaeking, authenticated}



class LoginProvider extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthStatus authStatus = AuthStatus.notAuthentication;

  //ingreso en un user
  Future<void> loginUser({
    required String usernameOrEmail,
    required String password,
    required Function onSuccess,
    required Function(String) onError,
  }) async {
    try{
      authStatus = AuthStatus.chaeking;
      notifyListeners();
      final String usernameOrEmaillowerCase = usernameOrEmail.toLowerCase();
      final QuerySnapshot result = await _firestore 
        .collection('user')
        .where('username_lowercase', isEqualTo: usernameOrEmaillowerCase)
        .limit(1)
        .get();

      if(result.docs.isNotEmpty){
        final String email = result.docs.first.get('email');
        final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, 
          password: password
          );
          onSuccess();
          return;
      }

      //para el ingreso en un email

      final QuerySnapshot resultEmail = await _firestore
        .collection('user')
        .where('email', isEqualTo: usernameOrEmaillowerCase)
        .limit(1)
        .get();

      if(resultEmail.docs.isNotEmpty){
        final String email = resultEmail.docs.first.get('email');
        final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
            email: email, 
            password: password
          );
          onSuccess();
          return;
      }

      onError('No se encontro usuario o email ingresados');   
    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found' || e.code == 'wrong password'){
        onError('Usuario o contraseña incorrectos');
      } else {
        onError(e.toString());
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
