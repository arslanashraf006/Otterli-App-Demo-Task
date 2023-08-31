import 'package:flutter/material.dart';
class TitleWidget extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  TitleWidget({required this.title,required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(title,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: 20.0,
      ),
    );
  }
}
