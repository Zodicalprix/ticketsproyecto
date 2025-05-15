import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/service/datos_service.dart';
import 'package:ticketsproyecto/src/widgets/campo_texto.dart';

void mostrarPanel(BuildContext context, String idDocumento) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (context) {
      TextEditingController solucionController = TextEditingController();
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CampoTexto(
              controller: solucionController,
              hintText: 'Solucion del caso',
              obscureText: false,
              validator:
                  (value) =>
                      value == null || value.isEmpty ? 'Campo requerido' : null,
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                  
                    await modificarCaso(
                      idDocumento,
                      solucionController.text,
                      'Abierto', 
                    );
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.star),
                  label: Text('Abierto'),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                  
                    await modificarCaso(
                      idDocumento,
                      solucionController.text,
                      'Cerrado', 
                    );
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.check),
                  label: Text('Cerrado'),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                  
                    await modificarCaso(
                      idDocumento,
                      solucionController.text,
                      'En Proceso', 
                    );
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                  label: Text('En Proceso'),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}