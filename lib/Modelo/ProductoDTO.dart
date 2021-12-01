class product{
  int _id_ps;
  String _producto_servicio;
  double _precio;
  int _id_negocio;
  String _url_imagen;

  product(
      this._id_ps, this._producto_servicio, this._precio, this._id_negocio,this._url_imagen);


  String get url_imagen => _url_imagen;

  set url_imagen(String value) {
    _url_imagen = value;
  }

  int get id_negocio => _id_negocio;

  set id_negocio(int value) {
    _id_negocio = value;
  }

  double get precio => _precio;

  set precio(double value) {
    _precio = value;
  }

  String get producto_servicio => _producto_servicio;

  set producto_servicio(String value) {
    _producto_servicio = value;
  }

  int get id_ps => _id_ps;

  set id_ps(int value) {
    _id_ps = value;
  }
}