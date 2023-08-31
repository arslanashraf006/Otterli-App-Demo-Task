import 'package:flutter/material.dart';

import '../constants.dart';

class RadioButtonWidget extends StatefulWidget {
  final List items;
  RadioButtonWidget({required this.items});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {

  int? current;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return  ListTile(
          title: Text(widget.items[index].toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
          leading: Radio(
            fillColor:
            MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) => AppColorAssets.appGreenColor),
            value: index,
            groupValue: current,
            onChanged: (value) {
              setState(() {
                current=value;
              });
            },
          ),
        );
      },),);
  }
}
