import 'package:flutter/material.dart';
import 'package:ticketsproyecto/src/widgets/campo_texto.dart';

void mostrarPanel(BuildContext context) {
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.star),
                  label: Text('Opción 1'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.check),
                  label: Text('Opción 2'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                  label: Text('Opción 3'),
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