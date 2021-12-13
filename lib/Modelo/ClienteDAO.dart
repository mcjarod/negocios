import 'ClienteDTO.dart';
import 'Conexion.dart';

class ClienteDAO {
  conexion db;
  ClienteDAO() : db = conexion();

  //lista de clientes por email y contraseña (1)
  Future<List<ClienteDTO>> listado(String email) async {
    final conn = await db.getconnection();
    List<ClienteDTO> lista = [];
    String sql = "select * from grupo7b_equipo2.clientes where email_cliente= '"+email+"';";
    conn.query(sql);
    var results = await conn.query(sql);
    for (var row in results) {
      lista.add(
          new ClienteDTO(
              row[0],
              row[1],
              row[2],
              row[3],
              row[4],
              row[5],
              row[6],
      )
      );
    }
    await conn.close();
    return lista;
  } //(1)

// Insert some data
  Future<bool> insertar(String nom, String email, String telefono, String dir, String pass) async {
    final conn = await db.getconnection();
    bool inserto=false;
    ClienteDTO clienteDTO = new ClienteDTO(0, nom, email, telefono, dir, pass, 2);
    var sql= 'insert into grupo7b_equipo2.clientes (nombre_cliente, email_cliente, telefono_cliente, direccion_cliente, contraseña, id_perfil) '
        'values("'+clienteDTO.nombre_cliente+'", "'+clienteDTO.email_cliente+'", "'+clienteDTO.telefono_cliente+'", "'+clienteDTO.direccion_cliente+'", "'+clienteDTO.contrasena+'", 2);';
    await conn.query(sql).then((value) {
      inserto=true;
    });
    await conn.close();
    return inserto;
  }

/*Insert some data
  Future<bool> actualizar(String nom, String email, String telefono, String dir, String pass) async {
    final conn = await db.getconnection();
    await db.getconnection("DROP TABLE IF EXISTS grupo7b_equipo2.clientes ");
    bool actu=false;
    ClienteDTO clienteDTO = new ClienteDTO(0, nom, email, telefono, dir, pass, 2);
    var sql= 'update into grupo7b_equipo2.clientes (nombre_cliente, email_cliente, telefono_cliente, direccion_cliente, contraseña, id_perfil) '
        'values("'+clienteDTO.nombre_cliente+'", "'+clienteDTO.email_cliente+'", "'+clienteDTO.telefono_cliente+'", "'+clienteDTO.direccion_cliente+'", "'+clienteDTO.contrasena+'", 2);';
    await conn.query(sql).then((value) {
      actu=true;
    });
    await conn.close();
    return actu;
  }

  Future<bool> Eliminar() async {
    final conn = await db.getconnection();
    await db.getconnection("DROP TABLE IF EXISTS into grupo7b_equipo2.clientes ");
  }*/

  //lista de clientes por email y contraseña (1)
  Future<List<ClienteDTO>> clientexid(String id) async {
    final conn = await db.getconnection();
    List<ClienteDTO> lista = [];
    String sql = "select * from grupo7b_equipo2.clientes where id_cliente= "+id+";";
    conn.query(sql);
    var results = await conn.query(sql);
    for (var row in results) {
      lista.add(
          new ClienteDTO(
            row[0],
            row[1],
            row[2],
            row[3],
            row[4],
            row[5],
            row[6],
          )
      );
    }
    await conn.close();
    return lista;
  } //(1)

}