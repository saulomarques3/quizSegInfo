import 'dart:convert';

import 'package:flutter/services.dart';

class QuestionManager {
  static List respostas = [];
  static Quiz quiz;
  static load()async {
    final quizData = jsonDecode(await rootBundle.loadString("assets/questions/questions.json"));
    quiz = Quiz.fromJson(quizData);
  }
}

class Quiz {
  List<Questions> questions;

  Quiz ({this.questions});

  Quiz.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = new List<Questions>();
      json['questions'].forEach((v) {
        questions.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String title;
  List<Option> questions;

  Questions({this.title, this.questions});

  Questions.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['questions'] != null) {
      questions = new List<Option>();
      json['questions'].forEach((v) {
        questions.add(new Option.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Option {
  String title;
  int value;

  Option({this.title, this.value});

  Option.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['value'] = this.value;
    return data;
  }
}