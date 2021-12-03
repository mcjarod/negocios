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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4/3,
              child: ClipRRect(
                child: Material(
                  child: Ink.image(
                    image: NetworkImage(negocio.logo), //AssetImage(pro.url_imagen),//
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: (){
                      },
                    ),
                  ),
                ),
              ),
            ),

            //Image.asset(negocio.logo, fit: BoxFit.cover,),
            //Image.network(negocio.logo, fit: BoxFit.cover),
            SizedBox(height: 15),
            Text("Nombre: "+negocio.nombre, style: TextStyle(fontSize: 20)),
            Text("Direccion: "+negocio.direccion, style: TextStyle(fontSize: 20)),
            Text(negocio.telefono==""?"Telefono no disponible":"Telefono: "+negocio.telefono, style: TextStyle(fontSize: 20)),
            Text(negocio.celular==""?"Celular no disponible":"Celular: "+negocio.celular, style: TextStyle(fontSize: 20)),
            Text(negocio.web==""?"Pagina web no disponible":"Pagina web: "+negocio.web, style: TextStyle(fontSize: 20))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  null,
        tooltip: 'Increment',
        child: const Icon(Icons.location_on),
      ),
    );
  }

}
