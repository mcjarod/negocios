import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/fabian_icons.dart';
import 'DetalleNegocio.dart';
import 'WidgetProductos.dart';

class TarjetaProducto extends StatelessWidget {
  List producto;
  int index;
  TarjetaProducto(this.producto, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          producto[index].producto_servicio,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text("\$ "+producto[index].precio.toStringAsFixed(0), style: TextStyle(fontSize: 17)),
          ],
        ),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(producto[index].url_imagen), //AssetImage(tienda[index].logo),//
          //child: Image.network("https://drive.google.com/uc?export=view&id=1kvLxC89BMNXw3aRmguELqYuPYqB-Hijd", fit: BoxFit.cover,)//Text(tienda[index].nombre.substring(0,1)),
        ),
        trailing: IconButton(onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>PaginaCompras(index: index,negocio: tienda,)));
        }, icon: Icon(Icons.control_point),iconSize: 40,),
        onTap: () {
        },
      ),
    );
  }
}
