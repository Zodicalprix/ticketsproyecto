import 'package:flutter/material.dart';

class BotonCrear extends StatelessWidget {
  const BotonCrear({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.add),
        SizedBox(width: 10),
        Text('Crear ticket'),
      ],
    ));
  }
}
class BotonPre extends StatelessWidget {
  final String textoBoton;
  final Widget Navegador;

  const BotonPre({
    super.key,
    required this.Navegador,
    required this.textoBoton,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF161927)),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => Navegador));
      },
      child: Text(
        textoBoton,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}