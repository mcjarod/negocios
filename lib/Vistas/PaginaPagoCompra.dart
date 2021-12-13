
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Modelo/PedidoDAO.dart';
import 'package:listatiendas/Modelo/ProductoDAO.dart';
import 'package:listatiendas/Modelo/Producto_PedidosDTO.dart';
import 'package:listatiendas/Modelo/Producto_pedidosDAO.dart';
import 'package:listatiendas/Modelo/Session.dart';

import 'Home.dart';




class PaginaPagoCompras extends StatefulWidget {
  final List productos_select;
  final List negocio;
  final String id_cliente;
  const PaginaPagoCompras({required this.productos_select,required this.negocio, required this.id_cliente,Key? key}) : super(key: key);


  @override
  State<PaginaPagoCompras> createState() => _PaginaPagoComprasState();
}


class _PaginaPagoComprasState extends State<PaginaPagoCompras> {
late Future<List> Listado;
late List tot=[];
double t=0;
int con=1;
int id_cliente=0;

  Future<List> cargarlista() async {
    List list=[];
    List producto=widget.productos_select;
    int id;
    for(var i=0; i<producto.length;i++){
      id=widget.productos_select[i].id_producto_servicio;
      list.add(await ProductoDAO().listadoproductos(id));
    }
    return list;
  }

  void total(){
    Listado.then((value) => {
      setState(() {
        for(var i=0; i<value.length;i++){
          t=t+(value[i].precio*widget.productos_select[i].cantidad);
        }
      })
    });
  }


  @override
  void initState() {
      Listado=cargarlista();
      total();
      Session sesion= Session();
      sesion.LeerSecureData("id_user").then((value) {
        setState(() {
          id_cliente = int.parse(value);
        });
      });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Realiza tu pedido"),
      ),
      body:  FutureBuilder(
          future: Listado,
          builder: (context, AsyncSnapshot<List> snapshot){
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
                    Text("no hay productos",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Text("seleccionados", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ],
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data==null ? 0: snapshot.data!.length,
                itemBuilder: (context, intem){
                  //return TarjetaProductoCompras(snapshot.data!, intem, widget.productos_select,t);
                  return Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data![intem].producto_servicio,
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text("\$ "+snapshot.data![intem].precio.toStringAsFixed(0), style: TextStyle(fontSize: 17)),
                        ],
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(snapshot.data![intem].url_imagen), //AssetImage(tienda[index].logo),//
                        //child: Image.network("https://drive.google.com/uc?export=view&id=1kvLxC89BMNXw3aRmguELqYuPYqB-Hijd", fit: BoxFit.cover,)//Text(tienda[index].nombre.substring(0,1)),
                      ),
                      trailing: Container(
                        //height: 100,
                        width: 110,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Cant.", style: TextStyle(fontSize: 15),),
                                  Text(!widget.productos_select.isEmpty && intem<widget.productos_select.length ?widget.productos_select[intem].cantidad.toString():""),
                                ],
                              ),
                            ),
                            IconButton(onPressed: (){
                              con = widget.productos_select[intem].cantidad;
                              setState(() {
                                if(widget.productos_select[intem].cantidad==1){
                                  mensajedialogo(context,snapshot.data!, intem);
                                }else{
                                  widget.productos_select[intem] =
                                  new Producto_pedidos(snapshot.data![intem].id_ps,
                                      con - 1, 0);
                                  setState(() {
                                    t=t-snapshot.data![intem].precio;
                                  });
                                }
                              });
                            }, icon: Icon(Icons.delete),iconSize: 30, color: Colors.red,),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),

      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [ElevatedButton(
        onPressed: (){
          showDialog(
            // barrierDismissible: false, //para que solo se cierre con los botones
            context: context,
            builder: (context)=> AlertDialog(
              title: Text("Confirmar pedido por valor el de \$"+t.toStringAsFixed(0)),
              actions: <Widget>[
                TextButton(onPressed:(){ Navigator.of(context).pop("s");}, child: Text("si")),
                TextButton(onPressed:(){ Navigator.of(context).pop("n");}, child: Text("no")),
              ],
            ),
          ).then((resultado) async {
            if(resultado=="s"){
              print(id_cliente);
              int id_pedido= await PedidoDAO().insertar(id_cliente,t);
              for(int i=0; i<widget.productos_select.length;i++){
                ProductopedidosDAO().insertar(widget.productos_select[i].id_producto_servicio,widget.productos_select[i].cantidad,id_pedido);
              }
              Mensaje(context, "Pedido realizado con exito, pronto lo enviaremos");
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MyApp(id_cliente: widget.id_cliente,)), (route) => false);
              //Navigator.of(context).pop();
            }
          });
        },
        child: Text("Pagar con domicilio \$"+t.toStringAsFixed(0) + "+1500" , style: TextStyle(fontSize: 25),),
      ),

            ElevatedButton(
              onPressed: (){
                showDialog(
                  // barrierDismissible: false, //para que solo se cierre con los botones
                  context: context,
                  builder: (context)=> AlertDialog(
                    title: Text("Confirmar pedido por valor el de \$"+t.toStringAsFixed(0)),
                    actions: <Widget>[
                      TextButton(onPressed:(){ Navigator.of(context).pop("s");}, child: Text("si")),
                      TextButton(onPressed:(){ Navigator.of(context).pop("n");}, child: Text("no")),
                    ],
                  ),
                ).then((resultado) async {
                  if(resultado=="s"){
                    print(id_cliente);
                    int id_pedido= await PedidoDAO().insertar(id_cliente,t);
                    for(int i=0; i<widget.productos_select.length;i++){
                      ProductopedidosDAO().insertar(widget.productos_select[i].id_producto_servicio,widget.productos_select[i].cantidad,id_pedido);
                    }
                    Mensaje(context, "Pedido realizado con exito, ve a la tienda");
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MyApp(id_cliente: widget.id_cliente,)), (route) => false);
                    //Navigator.of(context).pop();
                  }
                });
              },
              child: Text("Recoger en tienda con \$"+t.toStringAsFixed(0), style: TextStyle(fontSize: 25),),
            ),
    ]),


    );

  }

void mensajedialogo(BuildContext context,List producto,int index){
  showDialog(
    // barrierDismissible: false, //para que solo se cierre con los botones
    context: context,
    builder: (context)=> AlertDialog(
      title: Text("Eliminar el producto"),
      actions: <Widget>[
        TextButton(onPressed:(){ Navigator.of(context).pop("s");}, child: Text("si")),
        TextButton(onPressed:(){ Navigator.of(context).pop("n");}, child: Text("no")),
      ],
    ),
  ).then((resultado){
    if(resultado=="s"){
      setState(() {
        //producto_select.remove(producto_select[index]);
        widget.productos_select.remove(widget.productos_select[index]);
        t=t-producto[index].precio;
        Listado = cargarlista();
      });
      //Navigator.of(context).pop();
      //Mensaje(context, "Puedes reemplazar el producto por otro");
    }
  });
}

}


void Mensaje(BuildContext context, String msje) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msje),duration: Duration(seconds: 2),));
}
