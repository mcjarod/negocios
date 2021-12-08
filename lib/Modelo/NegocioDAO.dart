
import 'package:listatiendas/Modelo/NegocioDTO.dart';

import 'Conexion.dart';

class NegocioDAO {
  conexion db;

  NegocioDAO() : db = conexion();


  //lista de negocios (1)
  Future<List<Negocio>> listado() async {
    final conn = await db.getconnection();

    List<Negocio> lista = [];
    // String sql = "select * from base_negocios.negocios;";
    String sql = "select * from grupo7b_equipo2.negocios;";
    conn.query(sql);
    var results = await conn.query(sql);
    for (var row in results) {
      lista.add(
          new Negocio(
              row[0],
              row[1],
              row[2],
              row[3],
              row[4],
              row[5],
              row[6],
              row[7],
              row[8],
              row[9])
      );
    }
    await conn.close();
    return lista;
  } //(1)


//lista de negocios buscados por letras(2)
  Future<List<Negocio>> list_busqueda_negocio(query) async{
    final conn = await db.getconnection();

    List<Negocio> lista = [];
    //String sql = "SELECT * FROM base_negocios.negocios where nombre_negocio like '%"+query+"%';";
    String sql = "SELECT * FROM grupo7b_equipo2.negocios where nombre_negocio like '%"+query+"%';";
    conn.query(sql);
    var results = await conn.query(sql);
    for (var row in results) {
      lista.add(
          new Negocio(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9])
      );
    }
    await conn.close();
    return lista;
  }//(2)


//lista de negocios buscados por letras(2)
  Future<List<Negocio>> list_busqueda_negocio_producto(query) async{
    final conn = await db.getconnection();

    List<Negocio> lista = [];
    //String sql = "SELECT distinct n.id_negocio, n.nombre_negocio, n.id_tipo, n.telefono_negocio, n.celular_negocio, n.direccion_negocio, n.paginaweb_negocio, n.geolocalizacion_negocio, n.logo, n.foto FROM base_negocios.negocios n, base_negocios.productos_servicios p where p.producto_servicio like '%"+query+"%' and n.id_negocio=p.id_negocio;";
    String sql = "SELECT distinct n.id_negocio, n.nombre_negocio, n.id_tipo, n.telefono_negocio, n.celular_negocio, n.direccion_negocio, n.paginaweb_negocio, n.geolocalizacion_negocio, n.logo, n.foto FROM grupo7b_equipo2.negocios n, grupo7b_equipo2.productos_servicios p where p.producto_servicio like '%"+query+"%' and n.id_negocio=p.id_negocio;";
    conn.query(sql);
    var results = await conn.query(sql);
    for (var row in results) {
      lista.add(
          new Negocio(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9])
      );
    }
    await conn.close();
    return lista;
  }

  //lista de negocios por categoria (1)
  Future<List<Negocio>> listadoxcategoria(int id_categoria) async{
    final conn = await db.getconnection();

    List<Negocio> lista = [];
    // String sql = "select * from base_negocios.negocios;";
    String sql = "select * from grupo7b_equipo2.negocios where id_tipo = "+id_categoria.toString()+";";
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

