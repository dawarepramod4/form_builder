import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_builder/check_box.dart';
import 'package:form_builder/models/data.dart';
import 'package:form_builder/drop_down.dart';
import 'package:form_builder/services/database.dart';

class WidgetList extends ChangeNotifier {
  List<Widget> dynamicWidget = [];
  List<Data> data = [];

  addItem(Widget widget) {
    dynamicWidget.add(widget);
    notifyListeners();
  }

  getItems() {
    return dynamicWidget;
  }

  addData({
    required question,
    required answer,
    required element,
    required options,
  }) {
    Data toadd = Data(
        answer: answer,
        id: '',
        question: question,
        options: options,
        element: element);
    data.add(toadd);
  }

  updateAnswer({required query, required question, required answer}) {
    int index = data.indexWhere((element) => element.question == question);

    print(data.length);
    Data toUpdate = data[index];

    if (query == "add") {
      toUpdate.answer.add(answer);
    } else if (query == "remove") {
      toUpdate.answer.remove(answer);
    } else if (query == "replace") {
      toUpdate.answer = answer;
    }
    data[index] = toUpdate;

    // ignore: avoid_function_literals_in_foreach_calls
  }

  getData() {
    return data;
  }

  uploadData() async {
    data.forEach((value) {
      DbService().addData(
          answer: value.answer,
          element: value.element,
          options: List<String>.from(value.options),
          question: value.question);
    });
  }

  downloadData() async {
    dynamicWidget.clear();
    List<Data> downloadedData = await DbService().fetchAllData();
    //add all the data to current data
    for (int i = 0; i < downloadedData.length; i++) {
      List<String> stringOptions = List<String>.from(downloadedData[i].options);
      if (downloadedData[i].element == "CheckBox") {
        print("running");
        addItem(
            MyCheckBox(items: stringOptions, name: downloadedData[i].question,answer:List<String>.from(downloadedData[i].answer)));
      } else if (downloadedData[i].element == "DropDown") {
        addItem(CustomDropDown(
            items: stringOptions, name: downloadedData[i].question,dropdownValue: List<String>.from(downloadedData[i].answer)[0],));
      }
    }
  }
}
