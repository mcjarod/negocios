
import 'package:listatiendas/Modelo/CategoriasDTO.dart';

import 'Conexion.dart';

class CategoriaDAO{
  conexion db;
  CategoriaDAO(): db = conexion();


  //lista de categorias (1)
  Future<List<Categorias>> listado() async{
    final conn = await db.getconnection();
    List<Categorias> lista = [];
    String sql = "select * from grupo7b_equipo2.tipos_negocio;";
    conn.query(sql);
    var results = await conn.query(sql);
    for (var row in results) {
      lista.add(
          new Categorias(row[0], row[1])
      );
    }
    await conn.close();
    return lista;
  }//(1)



}

