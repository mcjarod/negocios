import 'package:listatiendas/Modelo/Conexion.dart';
import 'ProductoDTO.dart';


class ProductoDAO{
  conexion db;
  ProductoDAO(): db = conexion();


  //lista de productos por id de negocio (1)
  Future<List<product>> listado(int id_negocio) async{
    final conn = await db.getconnection();

    List<product> lista = [];
    String sql = "select * from base_negocios.productos_servicios where id_negocio="+id_negocio.toString()+";";
    conn.query(sql);
    var results = await conn.query(sql);
    for (var row in results) {
      lista.add(
          new product(row[0], row[1], row[2], row[3], row[4])
      );
    }
    await conn.close();
    return lista;
  }//(1)


}

