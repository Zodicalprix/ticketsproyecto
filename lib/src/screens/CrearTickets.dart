import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/screens/Profile.dart';
import 'package:ticketsproyecto/src/service/datos_service.dart' as datosService;
import 'package:ticketsproyecto/src/widgets/botones_icons.dart';
import 'package:ticketsproyecto/src/widgets/campo_texto.dart';
import 'package:ticketsproyecto/src/widgets/drawer.dart';

class Creartickets extends StatefulWidget {
  Creartickets({super.key,});


  @override
  State<Creartickets> createState() => _CrearticketsState();
}



class _CrearticketsState extends State<Creartickets> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController motivoTicketController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();

  @override
  void dispose() {
    motivoTicketController.dispose();
    descripcionController.dispose();
    super.dispose();
  }

  void crearTicketF() async {
    if (_formKey.currentState?.validate() ?? false) {
      await datosService.crearTickets(
        motivoTicketController.text,
        descripcionController.text,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F0FB),
      appBar: AppBar(
        leading: IconDrawer(),
        backgroundColor: Color(0xFF2A3A5B),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('TICKETS', style: TextStyle(color: Colors.white)),
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.8,
                  
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF2A3A5B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle_outline_outlined, color: Colors.white, size: 30),
                          SizedBox(width: 10),
                          Text(
                            'Crear Ticket',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      CampoTexto(
                        controller: motivoTicketController,
                        hintText: 'Motivo del Ticket',
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese un motivo';
                          }
                          return null;
                        },
                      ),
                      CampoDescripcion(
                        controller: descripcionController, 
                        hintText: 'Descripción del Ticket', 
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese una descripción';
                          }
                          return null;
                        },
                      ),
                      BotonFuncion(
                        textoBotonF: 'Crear Ticket', 
                        presionado: crearTicketF),
                      SizedBox(height: 15), 
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
