import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Modelo/ClienteDAO.dart';

class PagActualizar extends StatefulWidget{
  @override
  State<PagActualizar> createState() => _PagActualizarState();
}

class _PagActualizarState extends State<PagActualizar> {
  final Nomb= TextEditingController();
  final Tel= TextEditingController();
  final Direccion= TextEditingController();
  final Correo= TextEditingController();
  final Contrasena= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
            ],
          ),
          _Titulo(),
          _TextField(Nomb, Tel, Direccion, Correo, Contrasena),
          _Boton(Nomb, Tel, Direccion, Correo, Contrasena)
        ],
      ),
    );
  }
}

class _Boton extends StatelessWidget {
  final TextEditingController Nombre;
  final TextEditingController Telefono;
  final TextEditingController Direccion;
  final TextEditingController Correo;
  final TextEditingController Contrasena;

  _Boton(this.Nombre, this.Telefono, this.Direccion, this.Correo,
      this.Contrasena);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Color(0xff5511b0),
          borderRadius: BorderRadius.circular(50)
      ),
      child: TextButton(
        child: Text("Registrarse", style: TextStyle(color: Colors.white, fontSize: 18),),
        onPressed: () async {
          if(Nombre.text.isEmpty || Correo.text.isEmpty || Telefono.text.isEmpty || Direccion.text.isEmpty ||Contrasena.text.isEmpty){
            Mensaje(context, "Hay campos sin llenar");
          }else {
            var user = await ClienteDAO().insertar(Nombre.text, Correo.text, Telefono.text, Direccion.text, Contrasena.text);
            if(user){
              Navigator.pushNamed(context, "login");
              Mensaje(context, "Registrado");
            }else{
              Mensaje(context, "Error");
            }
          }
        },
      ),
    );
  }

}

class _TextField extends StatelessWidget{
  final TextEditingController Nomb;
  final TextEditingController Tel;
  final TextEditingController Direccion;
  final TextEditingController Correo;
  final TextEditingController Contrasena;

  _TextField(this.Nomb, this.Tel, this.Direccion,
      this.Correo, this.Contrasena);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(controller: Nomb, decoration: InputDecoration(prefixIcon: Icon(Icons.person, color: Colors.grey,),hintText: "Nombre"),),
          SizedBox(height: 20,),
          TextField(controller: Tel, decoration: InputDecoration(prefixIcon: Icon(Icons.phone, color: Colors.grey,),hintText: "Telefono")),
          SizedBox(height: 20,),
          TextField(controller: Direccion, decoration: InputDecoration(prefixIcon: Icon(Icons.home, color: Colors.grey,),hintText: "Dirección")),
          SizedBox(height: 20,),
          TextField(controller: Correo, decoration: InputDecoration(prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),hintText: "Correo")),
          SizedBox(height: 20,),
          TextField(controller: Contrasena, obscureText: true, decoration: InputDecoration(prefixIcon: Icon(Icons.visibility_off, color: Colors.grey,),hintText: "Contraseña")),
          SizedBox(height: 20,),
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
          TextButton(
              onPressed: () => Navigator.pushNamed(context, "login"),
              child: Text("Ingresar", style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),)
          ),
          Text("/", style: TextStyle(fontSize: 25, color: Colors.grey),),
          TextButton(
              onPressed: () => Navigator.pushNamed(context, "registrarse"),
              child: Text("Registrarse", style: TextStyle(fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),)
          ),
        ],
      ),
    );
  }
}

void Mensaje(BuildContext context, String msje) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msje)));
}