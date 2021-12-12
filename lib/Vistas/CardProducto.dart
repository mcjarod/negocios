import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Modelo/PedidoDTO.dart';
import 'package:listatiendas/Modelo/Producto_PedidosDTO.dart';
import 'package:listatiendas/Modelo/Session.dart';
import 'package:listatiendas/fabian_icons.dart';
import 'DetalleNegocio.dart';
import 'WidgetProductos.dart';

class TarjetaProducto extends StatelessWidget {
  List producto;
  int index;
  var productos_select =[];
  TarjetaProducto(this.producto, this.index, this.productos_select);
  int con=1;
  int hay=0;



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
          if(productos_select.length>0) {
            for (var i=0; i<productos_select.length;i++) {
              //print(producto[index].id_ps.toString()+"....."+id_productos[i].id_producto_servicio.toString());
              if (producto[index].id_ps==productos_select[i].id_producto_servicio) {
                con++;
                hay++;
                productos_select[i]= new Producto_pedidos(producto[index].id_ps, con, 0);
                Mensaje(context, "Producto agregado exitosamente al carrito de compras");
              }
            }
            if(hay==0){
              productos_select.add(new Producto_pedidos(producto[index].id_ps, con, 0));
              Mensaje(context, "Producto agregado exitosamente al carrito de compras");
              //print("agregado");
            }
          }else{
            productos_select.add(new Producto_pedidos(producto[index].id_ps, con, 0));
            Mensaje(context, "Producto agregado exitosamente al carrito de compras");
           // id_productos.add(new Producto_pedidos(2, con, 0));
          }
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>PaginaCompras(index: index,negocio: tienda,)));
        }, icon: Icon(Icons.control_point),iconSize: 40,),
        onTap: () {
        },
      ),
    );
  }
}

void Mensaje(BuildContext context, String msje) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msje),duration: Duration(milliseconds: 800),));
}
