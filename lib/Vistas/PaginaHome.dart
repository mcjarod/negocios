
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Modelo/NegocioDAO.dart';
import 'package:listatiendas/Modelo/NegocioDTO.dart';
import 'CardNegogio.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
            });
    }
}
