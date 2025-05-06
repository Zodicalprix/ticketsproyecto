import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextoProfile extends StatelessWidget {
  final String textoInicio;
  final String textoFinal;

  const TextoProfile({
    super.key,
    required this.textoInicio,
    required this.textoFinal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textoInicio,
          style: GoogleFonts.roboto(
            fontSize: 20,
          ),
        ),
        Text(
          textoFinal,
          style:TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
