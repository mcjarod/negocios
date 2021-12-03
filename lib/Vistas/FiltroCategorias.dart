
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Modelo/NegocioDAO.dart';
import 'package:listatiendas/Modelo/NegocioDTO.dart';
import 'CardNegogio.dart';

class FiltroCategorias extends StatefulWidget {
  final int item;
  final List categoria;
  const FiltroCategorias({required this.categoria, required this.item, Key? key}) : super(key: key);

  @override
  State<FiltroCategorias> createState() => _FiltroCategoriasState();
}


class _FiltroCategoriasState extends State<FiltroCategorias> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoria[widget.item].tipo_negocio),
      ),
      body:  FutureBuilder(
          future: NegocioDAO().listadoxcategoria(widget.categoria[widget.item].id_tipo),
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
