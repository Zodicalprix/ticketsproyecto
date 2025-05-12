

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

enum UserRole {admin, user, superAdmin}

class RegisterProvider extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // RegisterProvider(){
  //   checkSign();
  // }
  Future<void> registerUser({    required String username,
    required String email,
    required String password,
    required UserRole role,
    required String birth,
    required String age,
    required String token,
    required String createAt,
    required Function(String) onError,}
  )async{
    try{
      //convertir username minsuculas
      final String usernameLowercase = username.toLowerCase();

      //verificar si existe
      final bool userExist = await chekUserExist(usernameLowercase);
      if(userExist){
        onError('El usuario ya existe');
        return;
      }

    //verificar credenciales usuario

    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email, 
      password: password
    );
    final User user = userCredential.user!;
    final String userId = user.uid;




    final userDatos = {
      'id':userId,
      'username':username,
      'username_lowercase':usernameLowercase,
      'password':password,
      'email':email,
      'rol':role,
      'birth':birth,
      'age':age,
      'token':token,
      'createAt': createAt,
    };

    await _firestore.collection('users').doc(userId).set(userDatos);

    }on FirebaseAuthException catch(e){
      if (e.code == 'weak-password'){
        onError('La contraseña es muy debil');
      }else if (e.code == 'email-aready-in-use'){
        onError('El email ya esta en uso');
      }else{
        onError(e.toString());
      }
    }


    catch (e){
      onError('Error al registrar el usuario');
    }
  }
  Future<bool> chekUserExist(String username)async{
    final QuerySnapshot result = await _firestore
      .collection('users')
      .where('username', isEqualTo: username)
      .limit(1)
      .get();

    return result.docs.isNotEmpty;  
  }



}
