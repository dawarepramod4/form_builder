import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_builder/add_checkbox.dart';
import 'package:form_builder/add_dropdown.dart';
import 'package:form_builder/check_box.dart';
import 'package:form_builder/drop_down.dart';
import 'package:form_builder/widget_list.dart';
import 'package:provider/provider.dart';

class FormBuilder extends StatefulWidget {
  const FormBuilder({super.key});

  @override
  State<FormBuilder> createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {
  String dropdownValue = "DropDown";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetList widgetlist = Provider.of<WidgetList>(context, listen: true);
    List<Widget> dynamicWidget = widgetlist.getItems();

    return Scaffold(
      appBar: AppBar(
        title: Text("Form Builder"),
      ),
      body: Container(
        alignment: Alignment.topRight,
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dynamicWidget.length,
                  itemBuilder: ((context, index) {
                    return dynamicWidget[index];
                  }))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.add),
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    if (dropdownValue == "DropDown") {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const AddDropDown());
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const AddCheckBox());
                    }
                  });
                },
                items: <String>["DropDown", "CheckBox"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              ElevatedButton(
                  onPressed: () {
                    widgetlist.uploadData();
                  },
                  child: const Text("Submit")),
            ],
          )
        ]),
      ),
    );
  }
}
