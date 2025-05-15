import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<Map<String, dynamic>?> obtenerDatosUsuario() async {
  try {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return null;

    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (snapshot.exists) {
      return snapshot.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  } catch (e) {
    print('Error al obtener datos del usuario: $e');
    return null;
  }
}

Future<void> crearTickets(
  String motivo,
  String descripcion,
) async {
  try {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;
    final datosUser =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    //Ordenar los casos en acendente y obtener los datos de la colletion
    final QuerySnapshot = await FirebaseFirestore.instance
        .collection('tickets')
        .orderBy('Caso', descending: true)
        .limit(1)
        .get();

    int nuevoCaso = 1;
    if (QuerySnapshot.docs.isNotEmpty) {
      final lastCase =  QuerySnapshot.docs.first.data()['Caso'];
      nuevoCaso = lastCase + 1;
    }
    await FirebaseFirestore.instance.collection('tickets').add({
      'Caso': nuevoCaso,
      'userId': userId,
      'motivo': motivo,
      'descripcion': descripcion,
      'fechaCreacion': FieldValue.serverTimestamp(),
      'regional': datosUser.data()?['Regional'],
    });
  } catch (e) {
    print('Error al crear ticket: $e');
  }
}

Future<bool> crearTicketsUsers()async {

  final userId = FirebaseAuth.instance.currentUser?.uid;
  if (userId == null) return false;

  final doc =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();

  if (doc.exists) {
    final rol = doc.data()?['rol'];
    return rol == 'user';
  }

  return false;
}

