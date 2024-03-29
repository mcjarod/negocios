import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Modelo/ClienteDAO.dart';
import 'package:listatiendas/Modelo/Session.dart';

import '../Vistas/Home.dart';
import 'HeaderLogin.dart';
import 'LoginHeader.dart';
import 'TextFieldCustom.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usu = TextEditingController();

  final pass = TextEditingController();

  final Session session = Session();

  String id = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        physics: BouncingScrollPhysics(),
        children: [
          Stack(children: [
            HeaderLogin(),
            LoginHeader(),
          ]),
          _Titulo(),
          SizedBox(
            height: 40,
          ),
          //_EmailAndPassword(usu, pass),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextField(
                  controller: usu,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.grey,
                      ),
                      hintText: "Digite su correo"),
                ),
                SizedBox(height: 20),
                TextField(
                    controller: pass,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        hintText: "Contraseña")),
              ],
            ),
          ),
          ///////////
          _ForgotPassword(),
          SizedBox(
            height: 40,
          ),
          _BotonSignIn(usu, pass, session, id),
        ],
      ),
    );
  }
}

class _BotonSignIn extends StatelessWidget {
  final TextEditingController usuario;
  final TextEditingController pass;
  final Session session;
  String id = "";
  _BotonSignIn(this.usuario, this.pass, this.session, this.id);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Color(0xff5511b0),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextButton(
          child: Text("Ingresar",
              style: TextStyle(color: Colors.white, fontSize: 18)),
          onPressed: () async {
            if (usuario.text.isEmpty || pass.text.isEmpty) {
              Mensaje(context, "Hay campos vacíos, verifique");
            } else {
              List user = await ClienteDAO().listado(usuario.text);
              if (user.length > 0) {
                if (user[0].contrasena == pass.text) {
                  session.EscribirSecureData(
                      "id_user", user[0].id_cliente.toString());
                  session.LeerSecureData("id_user").then((value) {
                    if (value != null) {
                      id = value;
                    }
                  });
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyApp(
                                id_cliente: id,
                              )),
                      (route) => false);
                } else {
                  Mensaje(context, "contraseña incorrecta");
                }
              } else {
                Mensaje(
                    context,
                    "el correo " +
                        usuario.text +
                        " no existe en la base de datos, por favor registrese");
              }
            }
          }),
    );
  }
}

void Mensaje(BuildContext context, String msje) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msje)));
}

class _ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 25, top: 20),
      alignment: Alignment.centerRight,
      child: Text("Olvidaste la contraseña?"),
    );
  }
}

class _EmailAndPassword extends StatelessWidget {
  final TextEditingController usuario;
  final TextEditingController pass;
  _EmailAndPassword(this.usuario, this.pass);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            controller: usuario,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail_outline,
                  color: Colors.grey,
                ),
                hintText: "Digite su correo"),
          ),
          //TextFieldCustom(Icons.mail_outline, TextInputType.emailAddress, false,"Correo", usuario),
          SizedBox(height: 20),
          //TextFieldCustom(Icons.visibility_off, TextInputType.text, true,"Contraseña", pass),
          TextField(
              controller: pass,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  hintText: "Contraseña")),
        ],
      ),
    );
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Text("Ingresar",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text("/", style: TextStyle(fontSize: 25, color: Colors.grey)),
          TextButton(
              onPressed: () => Navigator.pushNamed(context, "registrarse"),
              child: Text(
                "Registrarse",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              )),
        ],
      ),
    );
  }
}
