//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quiz_test/src/question2.dart';

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  get children => null;

  int selected = -1;
  int currently = 0;

  @override
  Widget build(BuildContext context) {
    Questions question = QuestionManager.quiz.questions[currently];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[],
        title: Text("Quiz SegInfo to User"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(question.title),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    ...List.generate(question.questions.length,
                        (index) => optiontile(index, question.questions[index]))
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: selected > -1
                    ? () {
                        if (currently <
                            QuestionManager.quiz.questions.length - 1) {
                          setState(() {
                            currently++;
                            QuestionManager.respostas.add(question.questions[selected].value);
                            selected = -1;
                          });
                        } else {
                          Navigator.of(context).pushNamed("result");
                        }
                      }
                    : null,
                child: Text('Próxima pergunta'),
              ),
              ElevatedButton(
                onPressed: currently > 0? () {
                  if (currently < QuestionManager.quiz.questions.length - 1) {
                    setState(() {
                      currently--;
                      QuestionManager.respostas.removeLast();
                      selected = -1;
                    });
                  } else {
                    if (currently == QuestionManager.quiz.questions.length - 1) {
                      setState(() {
                        currently--;
                      });
                    }
                  }
                }:null,
                child: Text('Anterior'),
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

  optiontile(int index, Option option) {
    return RadioListTile(
      title: Text(option.title),
      activeColor: Colors.blue,
      value: selected,
      groupValue: index,
      onChanged: (int value) {
        setState(() {
          selected = index;
        });
      },
    );
  }
}
