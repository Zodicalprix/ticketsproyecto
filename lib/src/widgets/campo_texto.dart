import 'package:flutter/material.dart';


class CampoTexto extends StatelessWidget {
final controller;
final String hintText;
final bool obscureText;


const CampoTexto({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText, required String? Function(dynamic value) validator
  }
);

@override
Widget build(BuildContext context){
return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15)
              ),
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(15)
              ),
          fillColor: Color(0xFFF1F0FB),
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}


class CampoDescripcion extends StatelessWidget {
final controller;
final String hintText;



const CampoDescripcion({
    super.key,
    required this.controller,
    required this.hintText,

    required String? Function(dynamic value) validator
  }
);

@override
Widget build(BuildContext context){
return Expanded(
  child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 10),
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        expands: true,
        maxLines: null,
        minLines: null,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15)
                ),
              focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(15)
                ),
            fillColor: Color(0xFFF1F0FB),
            filled: true,
            hintText: hintText,
          ),
        ),
      ),
);
  }
}
