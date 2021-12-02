import 'package:mysql1/mysql1.dart';

class conexion {
  /*static String host = '10.0.2.2';
  static String user = 'root';
  static String pass = '1234';
  static String db = 'base_negocios';
  static int port = 3306;*/
  static String host = 'grupo25db2.c47knbsonjdi.us-east-2.rds.amazonaws.com';
  static String user = 'admin';
  static String pass = 'Grupo25DB2';
  static String db = 'grupo7b_equipo2';
  static int port = 3306;
  //nueva conexion base de datos en la nube

  conexion();

  Future<MySqlConnection> getconnection() async {
    var settings = ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: pass,
      db: db,
    );
    return await MySqlConnection.connect(settings);
  }
}