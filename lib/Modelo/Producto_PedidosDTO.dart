class Producto_pedidos{
  int _id_producto_servicio;
  int _cantidad;
  int _id_pedido;

  Producto_pedidos(this._id_producto_servicio, this._cantidad, this._id_pedido);

  int get id_pedido => _id_pedido;

  set id_pedido(int value) {
    _id_pedido = value;
  }

  int get cantidad => _cantidad;

  set cantidad(int value) {
    _cantidad = value;
  }

  int get id_producto_servicio => _id_producto_servicio;

  set id_producto_servicio(int value) {
    _id_producto_servicio = value;
  }
}