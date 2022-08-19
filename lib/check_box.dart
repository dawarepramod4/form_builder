import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  final String name;
  const CheckBox({super.key, required this.name});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
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
        children: [
          Text(
            "${widget.name}",
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
