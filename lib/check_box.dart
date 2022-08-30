import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_builder/widget_list.dart';
import 'package:provider/provider.dart';

class MyCheckBox extends StatefulWidget {
  final String name;
  final List<String> items;
  final List<String> answer;
  final element = 'CheckBox';
  const MyCheckBox(
      {super.key,
      required this.name,
      required this.items,
      required this.answer});

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    // WidgetList widgetList = Provider.of<WidgetList>(context);
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.items.length,
                itemBuilder: ((context, index) {
                  return CheckBoxTile(
                    label: widget.items[index],
                    name: widget.name,
                    answer: widget.answer,
                  );
                })),
          )
        ],
      ),
    );
  }
}

class CheckBoxTile extends StatefulWidget {
  final String label;
  final String name;
  final List<String> answer;
  bool checking = false;
  CheckBoxTile(
      {super.key,
      required this.label,
      required this.name,
      required this.answer}) {
    checking = answer.contains(label);

  }
  @override
  State<CheckBoxTile> createState() => _CheckBoxTileState();
}

class _CheckBoxTileState extends State<CheckBoxTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    WidgetList widgetList = Provider.of<WidgetList>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
            checkColor: Colors.white,
            value: widget.checking,
            onChanged: ((value) {
              setState(() {
                widget.checking = value!;
                if (widget.checking) {
                  widgetList.updateAnswer(
                      query: "add",
                      question: widget.name,
                      answer: widget.label);
                  // widgetList.data[widget.name].add(widget.label);
                } else {
                  widgetList.updateAnswer(
                      query: "remove",
                      question: widget.name,
                      answer: widget.label);
                  // widgetList.data[widget.name].remove(widget.label);
                }
              });
            })),
        Text(
          widget.label,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
