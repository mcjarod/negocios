import 'package:listatiendas/Modelo/Conexion.dart';
import 'ProductoDTO.dart';


class ProductoDAO{
  conexion db;
  ProductoDAO(): db = conexion();


  //lista de productos por id de negocio (1)
  Future<List<product>> listado(int id_negocio) async{
    final conn = await db.getconnection();

    List<product> lista = [];
    //String sql = "select * from base_negocios.productos_servicios where id_negocio="+id_negocio.toString()+";";
    String sql = "select * from grupo7b_equipo2.productos_servicios where id_negocio="+id_negocio.toString()+";";
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

//lista de productos por id de negocio y por coinsidencia de nombre de producto3 (1)
  Future<List<product>> list_producto_nombre(int id, query) async{
    final conn = await db.getconnection();

    List<product> lista = [];
    //String sql = "SELECT p.id_ps, p.producto_servicio, p.precio, p.id_negocio, url_imagen FROM base_negocios.negocios n, base_negocios.productos_servicios p where p.producto_servicio like '%"+query+"%' and n.id_negocio=p.id_negocio and p.id_negocio="+id.toString()+";";    conn.query(sql);
    String sql = "SELECT p.id_ps, p.producto_servicio, p.precio, p.id_negocio, url_imagen FROM grupo7b_equipo2.negocios n, grupo7b_equipo2.productos_servicios p where p.producto_servicio like '%"+query+"%' and n.id_negocio=p.id_negocio and p.id_negocio="+id.toString()+";";    conn.query(sql);
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

