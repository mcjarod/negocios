class PedidoDTO{
  int _id_pedido;
  int _id_cliente;
  DateTime _fecha_pedido;
  double _total_pedido;

  PedidoDTO(this._id_pedido, this._id_cliente, this._fecha_pedido, this._total_pedido);


  double get total_pedido => _total_pedido;

  set total_pedido(double value) {
    _total_pedido = value;
  }

  DateTime get fecha_pedido => _fecha_pedido;

  set fecha_pedido(DateTime value) {
    _fecha_pedido = value;
  }

  int get id_cliente => _id_cliente;

  set id_cliente(int value) {
    _id_cliente = value;
  }

  int get id_pedido => _id_pedido;

  set id_pedido(int value) {
    _id_pedido = value;
  }
}