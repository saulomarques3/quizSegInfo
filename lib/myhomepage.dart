import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[],
        title: Text("Quiz SegInfo to User"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 300,
                width: 300,
                child: Text("Seja Bem-Vindo ao Quiz sobre Segurança da Informação para usuário de internet.\n \n"
                    "O conteúdo das perguntas e respostas é baseado na Cartilha de Segurança para Internet do Cert.br", textAlign: TextAlign.justify,)),
            Container(
              height: 60,
              width: 300,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("question");
                },
                color: Colors.lightBlue,
                textColor: Colors.white,
                child: Text('Iniciar Quiz'),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              trailing: Icon(Icons.close),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('INÍCIO'),
              onTap: () {
                Navigator.of(context).pushNamed("home");
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('SOBRE NÓS'),
              onTap: () {
                Navigator.of(context).pushNamed("about");
              },
            ),
          ],
        ),
      ),
    );
  }
}
