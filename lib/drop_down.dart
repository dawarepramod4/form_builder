import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'package:form_builder/widget_list.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  final String name;
  final String element = "DropDown";
  // ignore: prefer_typing_uninitialized_variables
  var dropdownValue;
  CustomDropDown({
    Key? key,
    required this.items,
    required this.name,
    required this.dropdownValue,
  }) {
    dropdownValue = dropdownValue;
  }
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    WidgetList widgetList = Provider.of<WidgetList>(context);
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue.shade100,
            Colors.red.shade100,
          ],
        ),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 12,
            color: Color.fromRGBO(0, 0, 0, 0.16),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name,
              textAlign: TextAlign.left,
              softWrap: true,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          DropdownButton<String>(
            value: widget.dropdownValue,
            icon: const Icon(CupertinoIcons.arrow_down_circle),
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            onChanged: (String? newValue) {
              setState(() {
                widget.dropdownValue = newValue!;
                //add replace query
                widgetList.updateAnswer(
                      query: "replace",
                      question: widget.name,
                      answer: widget.dropdownValue);
              });
            },
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
