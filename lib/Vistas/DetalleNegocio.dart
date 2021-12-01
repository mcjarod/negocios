import 'package:flutter/material.dart';
import 'package:listatiendas/Modelo/NegocioDTO.dart';

class detalle extends StatelessWidget{
  Negocio negocio;
  detalle(this.negocio);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(negocio.nombre)),
      body: Center(
        child: Column(
          children: [
            //Image.asset(negocio.logo, fit: BoxFit.cover,),
            Image.network(negocio.logo, fit: BoxFit.cover),
            SizedBox(height: 15),
            Text("Nombre: "+negocio.nombre, style: TextStyle(fontSize: 20)),
            Text("Direccion: "+negocio.direccion, style: TextStyle(fontSize: 20)),
            Text("Telefono: "+negocio.telefono, style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }

}
