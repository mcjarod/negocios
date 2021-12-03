class Categorias{
  int _id_tipo;
  String _tipo_negocio;

  Categorias(this._id_tipo, this._tipo_negocio);

  String get tipo_negocio => _tipo_negocio;

  set tipo_negocio(String value) {
    _tipo_negocio = value;
  }

  int get id_tipo => _id_tipo;

  set id_tipo(int value) {
    _id_tipo = value;
  }
}