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