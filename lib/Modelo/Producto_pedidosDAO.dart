import 'package:listatiendas/Modelo/PedidoDAO.dart';
import 'package:listatiendas/Modelo/Producto_PedidosDTO.dart';
import 'package:listatiendas/Modelo/Session.dart';

import 'Conexion.dart';

class ProductopedidosDAO{
  conexion db;
  ProductopedidosDAO() : db = conexion();

  // Insert some data
  Future<bool> insertar(int id_producto_servicio, int cantidad, int id_pedido) async {
    final conn = await db.getconnection();
    bool registro=false;
    Producto_pedidos P_pedidoDTO = new Producto_pedidos(id_producto_servicio, cantidad, id_pedido);
    var sql= 'insert into grupo7b_equipo2.productos_pedidos (id_producto_servicio, cantidad, id_pedido) '
        'values('+P_pedidoDTO.id_producto_servicio.toString()+', '+P_pedidoDTO.cantidad.toString()+', '+P_pedidoDTO.id_pedido.toString()+');';
    await conn.query(sql).then((value) {
      registro=true;
    });
    await conn.close();
    return registro;
  }
}