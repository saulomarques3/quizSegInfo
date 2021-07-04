import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String nomeDaEmpresa;

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: TextFormField(
                  decoration: InputDecoration(labelText: "Nome da Empresa"),
                  onChanged: (text) {
                    nomeDaEmpresa = text;
                  }),
            ),
            Container(
              height: 60,
              width: 300,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("question");
                },
                color: Colors.lightBlue,
                textColor: Colors.white,
                child: Text('Identificar Empresa e iniciar'),
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
