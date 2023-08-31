import 'package:flutter/material.dart';

class HorizontalSizedWidget extends StatelessWidget {
  final double width;
 HorizontalSizedWidget(this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
