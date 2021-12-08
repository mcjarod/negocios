import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Session{
  final _storage = FlutterSecureStorage();
  Future EscribirSecureData(String key, String value) async {
    var escribirdato= await _storage.write(key: key, value: value);
    return escribirdato;
  }

  Future LeerSecureData(String key) async {
    var leerdata= await _storage.read(key: key);
    return leerdata;
  }

  Future EliminarSecureData(String key) async {
    var eliminardata= await _storage.delete(key: key);
    return eliminardata;
  }
}