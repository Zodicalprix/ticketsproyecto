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

//crear los tickets
Future<void> crearTickets(String motivo, String descripcion) async {
  try {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;
    final datosUser =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    //Ordenar los casos en acendente y obtener los datos de la colletion
    final QuerySnapshot =
        await FirebaseFirestore.instance
            .collection('tickets')
            .orderBy('Caso', descending: true)
            .limit(1)
            .get();

    int nuevoCaso = 1;
    if (QuerySnapshot.docs.isNotEmpty) {
      final lastCase = QuerySnapshot.docs.first.data()['Caso'];
      nuevoCaso = lastCase + 1;
    }
    await FirebaseFirestore.instance.collection('tickets').add({
      'Caso': nuevoCaso,
      'userId': userId,
      'motivo': motivo,
      'descripcion': descripcion,
      'fechaCreacion': FieldValue.serverTimestamp(),
      'Regional': datosUser.data()?['Regional'],
      'solucion': '',
      'estado': 'Abierto',
      'Tecnico': '',
    });
  } catch (e) {
    print('Error al crear ticket: $e');
  }
}



Future<bool> crearTicketsUsers() async {
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

//actualizar los tickets

Future<void> actualizarTicket(
  String docId,
  String solucion,
  String estado,
  String tecnico,
) async {
  try {
    await FirebaseFirestore.instance.collection('tickets').doc(docId).update({
      'solucion': solucion,
      'estado': estado,
      'Tecnico': tecnico,
    });
  } catch (e) {
    print('Error al actualizar ticket: $e');
  }
}


//modificar los tickets

Future<void> modificarCaso(String idDocumento, String solucion, String estado) async {
  try {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    final userData = userDoc.data();
    if (userData == null) return;

    final nombre = userData['Nombre'];
    
    if(idDocumento == null) return ;

    FirebaseFirestore.instance
        .collection('tickets')
        .doc(idDocumento)
        .update(
          {
            'solucion': solucion,
            'estado': estado,
            'Tecnico': nombre,
          },
        );
    

  } on FirebaseException catch (e) {
    print('Error al modificar el caso: $e');
  }
}
Future<Map<String, dynamic>?> obtenerDetallesCaso(String idDocumento) async {
  await Future.delayed(const Duration(seconds: 2));
  try {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance
            .collection('tickets')
            .doc(idDocumento)
            .get();
    if (snapshot.exists) {
      return snapshot.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  } catch (e) {
    print('Error al obtener detalles del caso: $e');
    return null;
  }
}

Future<bool> permisosBoton() async {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  if (userId == null) return false;

  final doc =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();

  if (doc.exists) {
    final rol = doc.data()?['rol'];
    return rol == 'admin' || rol == 'superadmin';
  }

  return false;
}