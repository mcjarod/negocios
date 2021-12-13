import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Login/Login.dart';
import 'package:listatiendas/Modelo/ClienteDAO.dart';
import 'package:listatiendas/Modelo/ClienteDTO.dart';
import 'package:listatiendas/Modelo/PedidoDAO.dart';
import 'package:listatiendas/Modelo/PedidoDTO.dart';
import 'package:listatiendas/Modelo/Session.dart';
import 'package:page_transition/page_transition.dart';

class Pagina_Pedido extends StatefulWidget{
  String id_cliente;
  Pagina_Pedido(this.id_cliente);
  @override
  State<Pagina_Pedido> createState() => _Pagina_PedidoState();
}

class _Pagina_PedidoState extends State<Pagina_Pedido> {


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
      child: FutureBuilder(
          future: PedidoDAO().listado(widget.id_cliente),
          builder: (context, AsyncSnapshot<List<PedidoDTO>> snapshot){
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
                    Text("No haz Realizado"),
                    SizedBox(height: 10),
                    Text("Pedidos aun"),
                  ],
                ),
              );
            }
            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data==null ? 0: snapshot.data!.length,
                  itemBuilder: (context, intem){
                    return Card(
                         child: ListTile(
                         title: Column(
                           children: [
                             Text("Fecha Pedido: "+snapshot.data![intem].fecha_pedido.toString().substring(0,10)+"     Hora: "+snapshot.data![intem].fecha_pedido.toString().substring(11,16)),
                             Text("Total Pedido: "+snapshot.data![intem].total_pedido.toString()),
                           ],
                         ),
                        )
                    );
                    //return tarjetas(snapshot.data!, intem);
                  }),
            );
          }),
    );
  }
}