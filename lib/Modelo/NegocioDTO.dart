class Negocio{
  int _id;
  String _nombre;
  int _id_tipo;
  String _telefono;
  String _celular;
  String _direccion;
  String _web;
  String _geolocalizacion;
  String _logo;
  String _foto;

  //CONSTRUCTOR
  Negocio(
      this._id,
      this._nombre,
      this._id_tipo,
      this._telefono,
      this._celular,
      this._direccion,
      this._web,
      this._geolocalizacion,
      this._logo,
      this._foto);

  //GETTERS Y SETTERS

  String get foto => _foto;

  set foto(String value) {
    _foto = value;
  }

  String get logo => _logo;

  set logo(String value) {
    _logo = value;
  }

  String get geolocalizacion => _geolocalizacion;

  set geolocalizacion(String value) {
    _geolocalizacion = value;
  }

  String get web => _web;

  set web(String value) {
    _web = value;
  }

  String get direccion => _direccion;

  set direccion(String value) {
    _direccion = value;
  }

  String get celular => _celular;

  set celular(String value) {
    _celular = value;
  }

  String get telefono => _telefono;

  set telefono(String value) {
    _telefono = value;
  }

  int get id_tipo => _id_tipo;

  set id_tipo(int value) {
    _id_tipo = value;
  }

  String get nombre => _nombre;

  set nombre(String value) {
    _nombre = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }


}