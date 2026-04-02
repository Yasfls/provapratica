import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cadastro_screen.dart';

class LoginScreen extends StatefulWidget {

  final String? nome;
  final String? email;
  final String? senha;

  LoginScreen({this.nome, this.email, this.senha});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  void login() {

    if (emailController.text == widget.email &&
        senhaController.text == widget.senha) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(nome: widget.nome ?? "Usuário"),
        ),
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email ou senha inválidos")),
      );

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Login"),
      backgroundColor: const Color.fromARGB(255, 127, 189, 153),
      titleTextStyle: TextStyle(color: Colors.white)),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email, color: const Color.fromARGB(255, 76, 130, 175)),
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                prefixIcon: Icon(Icons.lock, color: const Color.fromARGB(255, 76, 130, 175)),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: login,
              icon: Icon(Icons.login),
              label: Text("Entrar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(111, 76, 130, 175),
              ),
            ),

            SizedBox(height: 10),

            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroScreen()),
                );
              },
              icon: Icon(Icons.person_add),
              label: Text("Cadastrar usuário"),
            )
          ],
        ),
      ),
    );
  }
}