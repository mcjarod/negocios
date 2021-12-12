import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Vistas/PaginaHome.dart';
import 'package:listatiendas/Vistas/PaginaPedidos.dart';
import 'package:listatiendas/Vistas/PaginaUsuario.dart';

import 'fabian_icons.dart';



class MyApp extends StatefulWidget {
  String id_cliente;
  MyApp({required this.id_cliente,Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _paginactual=0;
  final List<Widget> _paginas =[
    Home(id_cliente: "0",),
    Pagina_Pedido("0"),
    usuario("0"),
  ];

  @override
  void initState() {
    _paginas[0]= Home(id_cliente: widget.id_cliente,);
    _paginas[1]= Pagina_Pedido(widget.id_cliente);
    _paginas[2]= usuario(widget.id_cliente);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Principal',
      home: Scaffold(
        //appBar: AppBar(title: Text("Tiendas"),),
        body: _paginas[_paginactual],

          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              setState(() {
                _paginactual=index;
              });
            },
            currentIndex: _paginactual,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(icon: Icon(FabianIcon.carro_compras), label: "Pedidos"),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), label: "Usuario")
          ],
      ),
      ),
    );
  }
}



