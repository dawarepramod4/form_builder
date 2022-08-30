import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_builder/models/data.dart';
import 'package:form_builder/widget_list.dart';
import 'package:http/http.dart' as http;

String uri = "http://192.168.169.165:4000";

class DbService {
  //send datat to db
  void addData(
      {required String question,
      required dynamic answer,
      required String element,
      required List<String> options}) async {
    try {
      Data data = Data(
          id: '',
          question: question,
          answer: answer,
          element: element,
          options: options);

      http.post(Uri.parse('$uri/api/question'),
          body: data.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      print("data sent");
    } catch (e) {
      print(e.toString());
    }
  }

  //get the questions from api
  Future<List<Data>> fetchAllData() async {
    List<Data> questionList = [];
    try {
      http.Response res = await http.get(Uri.parse('$uri/api/question'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      for (int i = 0; i < jsonDecode(res.body).length; i++) {
        print(jsonEncode(
              jsonDecode(res.body)[i]));
        questionList.add(
          Data.fromJson(
            jsonEncode(
              jsonDecode(res.body)[i],
            ),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
    print("data is in fluttter");
    return questionList;
  }
}
