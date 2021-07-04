import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiz_test/src/question2.dart';
import "package:url_launcher/url_launcher.dart";

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}


var linkText = TextStyle( color: Colors.blue);

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    int total = 0;
    for (int i = 0; i < QuestionManager.respostas.length; i++){
    total += QuestionManager.respostas[i];
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[],
        title: Text("Quiz SegInfo to User"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: 400,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'De 0 a 10 sua nota no quiz foi de: $total \n \n'
                      'Agradecemos por você utilizar o Quiz de Segurança da Informação para usuário. \n'
                      'Ficamos felizes por você obter mais conhecimento sobre o assunto tornando a internet um lugar mais seguro. \n \n'
                      'Caso deseje mais informações sobre segurança da informação acesse o site do Certbr e baixe a Cartilha de Segurança. \n \n'
                      'O conteúdo desse aplicativo foi baseado nessa Cartilha',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  child: RichText(
                    text:TextSpan(
                      children: [
                        TextSpan(
                          style: linkText,
                          text: "Clique aqui para acessar a Cartilha Certbr",
                          recognizer: TapGestureRecognizer()..onTap = () async {
                            var url = "https://cartilha.cert.br/";
                            if(await canLaunch(url)){
                              await launch(url);
                            } else{
                              throw "Não foi possível carregar a Url";
                            }
                          }
                        ),
                      ]
                    )
                  ),
                ),
                /*ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Link para a Cartilha de Segurança do Cert.br',
                    textAlign: TextAlign.center,
                  ),
                ),*/
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("home");
                  },
                  child: Text(
                    'INÍCIO',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
