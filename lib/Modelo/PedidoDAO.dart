import 'package:flutter/material.dart';

import 'Conexion.dart';
import 'PedidoDTO.dart';

class PedidoDAO{
  conexion db;
  PedidoDAO() : db = conexion();

  // Insert some data
  Future<int> insertar(int id_cliente, double total) async {
    final conn = await db.getconnection();
    int id=0;
    PedidoDTO pedidoDTO = new PedidoDTO(0, id_cliente, DateTime.now(),total);
    var sql= 'insert into grupo7b_equipo2.pedidos (id_cliente, fecha_pedido,total_pedido) '
        'values('+pedidoDTO.id_cliente.toString()+', "'+pedidoDTO.fecha_pedido.toString()+'", '+pedidoDTO.total_pedido.toString()+');';
    await conn.query(sql).then((value) {
      id=value.insertId!;
    });
    await conn.close();
    return id;
  }

  //lista de pedidosxcliente (1)
  Future<List<PedidoDTO>> listado(String id_cliente) async {
    final conn = await db.getconnection();
    List<PedidoDTO> lista = [];
    String sql = "select * from grupo7b_equipo2.pedidos where id_cliente="+id_cliente+";";
    conn.query(sql);
    var results = await conn.query(sql);
    for (var row in results) {
      lista.add(new PedidoDTO(row[0], row[1], row[2], row[3]));
    }
    await conn.close();
    return lista;
  } //(1)
}