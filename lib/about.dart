import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[],
        title: Text("Quiz SegInfo to User"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 200,
                width: 300,
                child: Text(
                  "O aplicativo é parte de um estudo, que compõe o curso de Mestrado em Informática Aplicada na Universidade Federal Rural de Pernambuco. "
                      "O aplicativo Quiz SegInfo para Usuário tem o intuito de fomentar conhecimento sobre segurança da informação para usuários comuns, "
                      "de uma maneira rápida e divertida através de um Quiz do conhecimento sobre o assunto.",
                  textAlign: TextAlign.justify,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("home");
                },
                child: Text('INÍCIO'),
              ),
            ],
          ),
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
