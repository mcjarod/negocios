
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Modelo/CategoriasDAO.dart';
import 'package:listatiendas/Modelo/CategoriasDTO.dart';
import 'package:listatiendas/Modelo/NegocioDAO.dart';
import 'package:listatiendas/Modelo/NegocioDTO.dart';
import 'package:listatiendas/Modelo/ProductoDAO.dart';
import 'package:listatiendas/Modelo/ProductoDTO.dart';
import 'package:listatiendas/Vistas/BuscadorNegocio.dart';
import 'package:listatiendas/Vistas/BuscadorProducto.dart';
import 'package:listatiendas/Vistas/CardProducto.dart';
import 'package:listatiendas/Vistas/PaginaPagoCompra.dart';
import 'package:listatiendas/fabian_icons.dart';
import 'CardNegogio.dart';
import 'FiltroCategorias.dart';

class PaginaCompras extends StatefulWidget {
  final List negocio;
  final int index;
  final String id_cliente;
  const PaginaCompras({required this.index, required this.negocio, required this.id_cliente,Key? key}) : super(key: key);

  @override
  State<PaginaCompras> createState() => _PaginaComprasState();
}


class _PaginaComprasState extends State<PaginaCompras> {
  var list=[];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.negocio[widget.index].nombre),
        ),
      body:  FutureBuilder(
          future: ProductoDAO().listado(widget.negocio[widget.index].id),
          builder: (context, AsyncSnapshot<List<product>> snapshot){
            if(!snapshot.hasData)
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                ),
              );
            if(snapshot.data!.length ==0){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("no hay"),
                    SizedBox(height: 10),
                    Text("datos"),
                  ],
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data==null ? 0: snapshot.data!.length,
                itemBuilder: (context, intem){
                  return TarjetaProducto(snapshot.data!, intem, list);
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaginaPagoCompras(productos_select: list, negocio: widget.negocio,id_cliente: widget.id_cliente,)));
        },
        tooltip: 'Carrito de compras',
        child: const Icon(FabianIcon.carro_compras),
      ),

    );

  }
}
