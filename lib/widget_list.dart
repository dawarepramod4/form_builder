import 'package:flutter/cupertino.dart';

class WidgetList extends ChangeNotifier {
  List<Widget> dynamicWidget = [];

  addItem(Widget widget) {
    dynamicWidget.add(widget);
    notifyListeners();
  }

  getItems() {
    return dynamicWidget;
  }
}
