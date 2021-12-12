import 'package:flutter/material.dart';
import 'package:listatiendas/Modelo/NegocioDAO.dart';

import 'CardNegogio.dart';

class Buscador_Negocio extends SearchDelegate{
  String id_cliente;
  Buscador_Negocio(this.id_cliente) : super(searchFieldLabel: "Buscar por negocio");
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            query = "";
          },
          icon: Icon(Icons.clear)
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Center(child: Text("?", style: TextStyle(fontSize: 45),),);
    }else{
      return FutureBuilder(
          future: NegocioDAO().list_busqueda_negocio(query),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data==null ? 0: snapshot.data!.length,
                  itemBuilder: (context, item){
                    return tarjetas(snapshot.data!, item,id_cliente);
                  });
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      );
    }
  }

}