
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Modelo/NegocioDAO.dart';
import 'package:listatiendas/Modelo/NegocioDTO.dart';
import 'package:listatiendas/Vistas/BuscadorNegocio.dart';
import 'package:listatiendas/Vistas/BuscadorProducto.dart';
import 'CardNegogio.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Tiendas"),
        actions: [
          IconButton(
              onPressed: (){
                showDialog(
                    // barrierDismissible: false, //para que solo se cierre con los botones
                    context: context,
                    builder: (context)=> AlertDialog(
                        title: Text("Seleccione el tipo de busqueda"),
                        actions: <Widget>[
                          TextButton(onPressed:(){ Navigator.of(context).pop("n");}, child: Text("Buscar por Negocio")),
                          TextButton(onPressed:(){ Navigator.of(context).pop("p");}, child: Text("Buscar por producto")),
                          TextButton(onPressed:(){ Navigator.of(context).pop();}, child: Text("cancelar"))
                        ],
                      ),
                ).then((resultado){
                  if(resultado=="n"){
                    showSearch(
                        context: context, delegate: Buscador_Negocio()
                    );
                  }else if(resultado=="p"){
                    showSearch(
                        context: context, delegate: Buscador_Producto()
                    );
                  }
                });
              },
              icon: Icon(Icons.search)
          )
        ],
      ),
      body:  FutureBuilder(
          future: NegocioDAO().listado(),
          builder: (context, AsyncSnapshot<List<Negocio>> snapshot){
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
                  return tarjetas(snapshot.data!, intem);
                });
          }),
    );

    }
}
