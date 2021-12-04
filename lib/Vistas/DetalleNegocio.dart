import 'package:flutter/material.dart';
import 'package:listatiendas/Modelo/NegocioDTO.dart';
import 'package:listatiendas/Vistas/Geolocalizacion.dart';
import 'package:url_launcher/url_launcher.dart';

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
            Row(
              children: [
                Text("Link pagina web: ", style: TextStyle(fontSize: 20)),
                SizedBox(width: 10,),
                IconButton(onPressed: (){
                  launch(negocio.web);
                }, icon: Icon(Icons.link,size: 30,))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Geolocalizacion(geo: negocio.geolocalizacion, title: negocio.nombre))),
        tooltip: 'ubicacion',
        child: const Icon(Icons.location_on),
      ),
    );
  }

}
