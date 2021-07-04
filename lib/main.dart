import 'package:flutter/material.dart';
import 'package:quiz_test/question1.dart';
import 'package:quiz_test/identify.dart';
import 'package:quiz_test/about.dart';
import 'package:quiz_test/src/question2.dart';
import 'package:quiz_test/src/result.dart';
import 'myhomepage.dart';
import 'package:url_launcher/url_launcher.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuestionManager.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF808080),
        accentColor: Colors.white54,
        //visualDensity: VisualDensity.adaptativePlatformDensty,
      ),
      initialRoute: "home",
      routes: {
        "home": (context) => Home(),
        "about": (context) => About(),
        "identify": (context) => Login(),
        "question": (context) => Question(),
        "result": (context) => Result(),
      },
    );
  }
}



