import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_builder/drop_down.dart';
import 'package:form_builder/widget_list.dart';
import 'package:provider/provider.dart';

import 'homePage.dart';

class AddDropDown extends StatefulWidget {
  const AddDropDown({super.key});

  @override
  State<AddDropDown> createState() => _AddDropDownState();
}

class _AddDropDownState extends State<AddDropDown> {
  @override
  Widget build(BuildContext context) {
    WidgetList widgetList = Provider.of<WidgetList>(
      context,
    );
    List<String> items = [];
    String name = "DropDown";
    String element = "DropDown";
    final messageController = TextEditingController();
    final nameController = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    _addDropDown() {
      name = nameController.text;
      widgetList.addData(
          question: name, answer: [], element: element, options: items);
      widgetList.addItem(CustomDropDown(items: items, name: name,dropdownValue: items[0],));
    }

    return AlertDialog(
      title: const Text('Add DropDown'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration:
                  const InputDecoration(hintText: "Enter Name of Field"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: messageController,
              decoration: const InputDecoration(hintText: "Enter Options"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  items.add(messageController.text);
                  messageController.clear();
                },
                child: const Text("Add Options"))
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Approve'),
          onPressed: () {
            _addDropDown();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
