import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {

  final String? nome;

  HomeScreen({this.nome});

  final livros = [
    {"titulo": "O iluminado", "autor": "Stephen King"},
    {"titulo": "Salem's Lot", "autor": "Stephen King"},
    {"titulo": "O Hobbit", "autor": "J.R.R. Tolkien"},
    {"titulo": "Alice no País das Maravilhas", "autor": "Lewis Carroll"},
    {"titulo": "Coraline", "autor": "Neil Gaiman"},
  ];

  void logoff(BuildContext context) {

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => false,

      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: const Color.fromARGB(255, 127, 189, 153),
          titleTextStyle: TextStyle(color: Colors.white),
          automaticallyImplyLeading: false,
        ),

        body: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                "Bem-vindo, ${nome ?? "Usuário"}!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              Text(
                "Últimos livros lidos:",
                style: TextStyle(fontSize: 18),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: livros.length + 1,

                  itemBuilder: (context, index) {

                    if (index < livros.length) {

                      return ListTile(
                        leading: Icon(
                          Icons.menu_book,
                          color: const Color.fromARGB(255, 76, 130, 175),
                        ),
                        title: Text(livros[index]["titulo"]!),
                        subtitle: Text(livros[index]["autor"]!),
                      );

                    } else {

                      return Padding(
                        padding: EdgeInsets.only(top: 20),

                        child: ElevatedButton.icon(
                          onPressed: () => logoff(context),
                          icon: Icon(Icons.logout),
                          label: Text("Logoff"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(111, 76, 130, 175),
                          ),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}