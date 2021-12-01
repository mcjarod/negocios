import 'package:flutter/material.dart';
import 'package:listatiendas/Modelo/ProductoDAO.dart';
import 'package:listatiendas/Modelo/ProductoDTO.dart';



class productos_cards extends StatefulWidget {
  final int id;
  const productos_cards({required this.id, Key? key}) : super(key: key);


  @override
  State<productos_cards> createState() => _productos_cardsState();
}

class _productos_cardsState extends State<productos_cards> {


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: ProductoDAO().listado(widget.id),
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
                  Text("data"),
                ],
              ),
            );
          }
          return Container(
            padding: EdgeInsets.fromLTRB(8, 15, 8, 15),
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data==null ? 0: snapshot.data!.length,
              separatorBuilder: (context, _)=>SizedBox(width: 10,),
              itemBuilder: (context, index)=>buildcar(snapshot.data![index]),
            ),
          );

        }
    );
  }

  Widget buildcar(product pro){
    return Container(
      width: 200,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 4/3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Material(
                  child: Ink.image(
                    image: AssetImage(pro.url_imagen),//NetworkImage(pro.url_imagen),
                    //fit: BoxFit.cover,
                    child: InkWell(
                      onTap: (){
                        print(pro.url_imagen);
                        print("id de negocio: "+pro.id_negocio.toString());
                        print("producto: "+pro.producto_servicio);
                        print("-------------------------------------------");
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4,),
          Text(pro.producto_servicio, style: TextStyle(fontSize: 17),),
          Text("\$ "+pro.precio.toStringAsFixed(0), style: TextStyle(fontSize: 17))
        ],
      ),
    );
  }

}
