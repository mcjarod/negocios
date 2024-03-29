import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:listatiendas/Login/Login.dart';
import 'package:listatiendas/Modelo/Session.dart';
import 'package:page_transition/page_transition.dart';

import 'Vistas/Home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();// inicializar la base de datos
  await Firebase.initializeApp();
  runApp(const Splash());
}


class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Session session = Session();
  late String id="";
  @override
  void initState() {
    session.LeerSecureData("id_user").then((value) {
      if(value!=null){
        id = value;
      }
    });
    Timer(Duration(seconds: 3), ()=> Navigator.pushReplacement(context, PageTransition(child: id==""?Login():MyApp(id_cliente: id,), type: PageTransitionType.leftToRightWithFade)));

    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen(
          (message) {
        if (message.notification != null) {
          print(message.notification!.body);
          print(message.notification!.title);
        }
        //LocalNotificationService.display(message);
        print(message);
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
          (messagge) {
        final routeMessagge = messagge.data["route"];
        print(routeMessagge);
        Navigator.of(context).pushNamed(routeMessagge);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Text("Bienvenidos a miTienda", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
      ),
    );
  }
}
