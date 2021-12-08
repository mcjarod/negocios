class ClienteDTO{
  int _id_cliente;
  String _nombre_cliente;
  String _email_cliente;
  String _telefono_cliente;
  String _direccion_cliente;
  String _contrasena;
  int id_perfil;

  ClienteDTO(this._id_cliente, this._nombre_cliente, this._email_cliente,
      this._telefono_cliente, this._direccion_cliente, this._contrasena,
      this.id_perfil);

  String get contrasena => _contrasena;

  set contrasena(String value) {
    _contrasena = value;
  }

  String get direccion_cliente => _direccion_cliente;

  set direccion_cliente(String value) {
    _direccion_cliente = value;
  }

  String get telefono_cliente => _telefono_cliente;

  set telefono_cliente(String value) {
    _telefono_cliente = value;
  }

  String get email_cliente => _email_cliente;

  set email_cliente(String value) {
    _email_cliente = value;
  }

  String get nombre_cliente => _nombre_cliente;

  set nombre_cliente(String value) {
    _nombre_cliente = value;
  }

  int get id_cliente => _id_cliente;

  set id_cliente(int value) {
    _id_cliente = value;
  }
}