import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/cadastro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Controle de Leitura",

      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: const Color.fromARGB(255, 232, 244, 245),
      ),

      initialRoute: "/",

      routes: {
        "/": (context) => LoginScreen(),
        "/cadastro": (context) => CadastroScreen(),
      },
    );
  }
}