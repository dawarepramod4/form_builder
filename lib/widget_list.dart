import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:form_builder/services/database.dart';

class WidgetList extends ChangeNotifier {
  List<Widget> dynamicWidget = [];
  Map<String, dynamic> data = {};
  addItem(Widget widget) {
    dynamicWidget.add(widget);
    notifyListeners();
  }

  getItems() {
    return dynamicWidget;
  }

  addData(key, value) {
    data[key] = value;
  }

  getData() {
    return data;
  }

  uploadData() async {
    data.forEach((key, value) {
      DbService().addData(answer: value, question: key);
    });
  }
}
