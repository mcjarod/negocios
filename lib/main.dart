import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Vistas/PaginaHome.dart';
import 'package:listatiendas/Vistas/PaginaUsuario.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _paginactual=0;
  final List<Widget> _paginas =[
    Home(),
    usuario(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), label: "Usuario")
          ],
      ),
      ),
    );
  }
}



