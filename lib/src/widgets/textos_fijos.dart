import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextosProfile extends StatelessWidget {
  final String textoInicialP;
  final String textoFinalP;

  const TextosProfile({
    super.key,
    required this.textoInicialP,
    required this.textoFinalP,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0xFF2A3A5B),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xFF161927),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              textoInicialP,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                textoFinalP,
                style: TextStyle(color: Colors.white, fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
