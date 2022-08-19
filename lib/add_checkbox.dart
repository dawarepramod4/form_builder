import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_builder/widget_list.dart';
import 'package:provider/provider.dart';
import 'check_box.dart';

class AddCheckBox extends StatefulWidget {
  const AddCheckBox({super.key});

  @override
  State<AddCheckBox> createState() => _AddCheckBoxState();
}

class _AddCheckBoxState extends State<AddCheckBox> {
  @override
  Widget build(BuildContext context) {
    WidgetList widgetList = Provider.of<WidgetList>(
      context,
    );
    List<String> items = [];
    String name = "CheckBox";
    final messageController = TextEditingController();
    final nameController = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    _addCheckBox() {
      name = nameController.text;
      widgetList.addItem(MyCheckBox(items: items,
        name: name,
      ));
    }

    return AlertDialog(
      title: const Text('Add DropDown'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Enter Options"),
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
            _addCheckBox();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
