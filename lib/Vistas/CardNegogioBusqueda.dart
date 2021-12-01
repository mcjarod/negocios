import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Vistas/WidgetProductosBusqueda.dart';
import 'package:listatiendas/fabian_icons.dart';
import 'DetalleNegocio.dart';
import 'WidgetProductos.dart';


class tarjetasBusqueda extends StatelessWidget{
  List tienda;
  int index;
  String query;
  tarjetasBusqueda(this.tienda, this.index, this.query);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(tienda[index].nombre, style: TextStyle(fontSize: 20),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(tienda[index].direccion, style: TextStyle(fontSize: 18)),
              ],
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(tienda[index].logo, scale: 3), //AssetImage(tienda[index].logo),//
              //child: Image.network("https://drive.google.com/uc?export=view&id=1kvLxC89BMNXw3aRmguELqYuPYqB-Hijd", fit: BoxFit.cover,)//Text(tienda[index].nombre.substring(0,1)),
            ),
            trailing: Icon(FabianIcon.carro_compras),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>detalle(tienda[index])));
            },
          ),
          Card(
            child: productos_cardsBusqueda(id: tienda[index].id, query: query),
          )
        ],
      ),
    );
  }

}