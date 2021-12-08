import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget{
  final IconData icono;
  final TextInputType type;
  final bool pass;
  final String texto;
  final TextEditingController controlador;


  const TextFieldCustom(this.icono, this.type, this.pass, this.texto, this.controlador);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controlador,
      keyboardType: type,
      obscureText: pass,
      decoration: InputDecoration(
        hintText: texto,
        filled: true,
        fillColor: Color(0xffEBDCFA),
        prefixIcon: Icon(icono, color: Colors.grey,),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffEBDCFA)),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );

  }

}