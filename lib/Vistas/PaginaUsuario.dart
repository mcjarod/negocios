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
    return Container(
      decoration: new BoxDecoration(
          color: Colors.deepPurpleAccent,
          image: new DecorationImage(
              fit: BoxFit.cover,
              image: new AssetImage('assets/images/Navidad2.jpg')
          )
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xffFDCF09),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/Perfil.jpg'),
              ),
            ),
            Text(cliente.length>0?cliente[0].nombre_cliente:"", style: TextStyle(fontSize: 26,color: Colors.white),),
            Text(cliente.length>0?cliente[0].email_cliente:"", style: TextStyle(fontSize: 18,color: Colors.black),),
            Text(cliente.length>0?cliente[0].telefono_cliente:"", style: TextStyle(fontSize: 14,color: Colors.black),),
            TextButton(
              onPressed: () {
              },
              child: Text("Actualizar datos",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
            TextButton(
              onPressed: () {
              },
              child: Text("Darse de baja",
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
            ),
            ElevatedButton(onPressed: (){
              Session se= Session();
              se.EliminarSecureData("id_user");
              Navigator.pushReplacement(context, PageTransition(child: Login(), type: PageTransitionType.leftToRightWithFade));
            }, child: Text("Cerrar Sesion"))
          ],
        ),
      ),
    );
  }
}