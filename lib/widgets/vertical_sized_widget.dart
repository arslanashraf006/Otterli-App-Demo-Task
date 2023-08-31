import 'package:flutter/material.dart';

class VerticalSizedWidget extends StatelessWidget {
  final double height;
  VerticalSizedWidget(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}