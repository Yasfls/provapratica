import 'package:flutter/material.dart';
import 'login_screen.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  void cadastrar() {

    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text;

    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Preencha todos os campos")),
      );

      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(
          nome: nome,
          email: email,
          senha: senha,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Cadastro"),
      backgroundColor: const Color.fromARGB(255, 127, 189, 153),
      titleTextStyle: TextStyle(color: Colors.white)),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: "Nome",
                prefixIcon: Icon(Icons.person, color: const Color.fromARGB(255, 76, 130, 175)),
              ),
            ),

            SizedBox(height: 10),

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

            SizedBox(height: 25),

            ElevatedButton.icon(
              onPressed: cadastrar,
              icon: Icon(Icons.person_add),
              label: Text("Cadastrar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(111, 76, 130, 175),
              ),
            )
          ],
        ),
      ),
    );
  }
}