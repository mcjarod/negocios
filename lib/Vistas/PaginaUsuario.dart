import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Login/Login.dart';
import 'package:listatiendas/Modelo/Session.dart';
import 'package:page_transition/page_transition.dart';

class usuario extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Usuario", style: TextStyle(fontSize: 40),),
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