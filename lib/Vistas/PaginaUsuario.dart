import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Login/Login.dart';
import 'package:listatiendas/Modelo/ClienteDAO.dart';
import 'package:listatiendas/Modelo/ClienteDTO.dart';
import 'package:listatiendas/Modelo/Session.dart';
import 'package:page_transition/page_transition.dart';

class usuario extends StatefulWidget{
  final String id_cliente;
  usuario(this.id_cliente);
  @override
  State<usuario> createState() => _usuarioState();
}

class _usuarioState extends State<usuario> {
  List cliente=[];


  Future<void> list() async {
    cliente = await ClienteDAO().clientexid(widget.id_cliente);
    setState(() {
    });
  }

  @override
  void initState() {
    setState(() {
      list();
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(cliente.length>0?cliente[0].nombre_cliente:"", style: TextStyle(fontSize: 24),),
          Text(cliente.length>0?cliente[0].email_cliente:"", style: TextStyle(fontSize: 24),),
          ElevatedButton(onPressed: (){
            Session se= Session();
            se.EliminarSecureData("id_user");
            Navigator.pushReplacement(context, PageTransition(child: Login(), type: PageTransitionType.leftToRightWithFade));
          }, child: Text("Cerrar Sesion"))
        ],
      ),
    );
  }
}