import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/cadastro_screen.dart';
import '../screens/login_screen.dart';


class AppRoutes {
  static const login = '/';
  static const cadastro = '/cadastro';
  static const home = '/home';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginScreen(),
    cadastro: (context) => CadastroScreen(),
    home: (context) {
      final nome = ModalRoute.of(context)!.settings.arguments as String;
      return HomeScreen(nome: nome);
    }
  };
}