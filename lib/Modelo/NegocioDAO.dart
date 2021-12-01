
import 'package:listatiendas/Modelo/NegocioDTO.dart';

import 'Conexion.dart';

class NegocioDAO{
  conexion db;
  NegocioDAO(): db = conexion();


    //lista de negocios (1)
    Future<List<Negocio>> listado() async{
      final conn = await db.getconnection();

      List<Negocio> lista = [];
      String sql = "select * from base_negocios.negocios;";
      conn.query(sql);
      var results = await conn.query(sql);
      for (var row in results) {
        lista.add(
            new Negocio(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9])
        );
      }
      await conn.close();
      return lista;
    }//(1)

    
}

