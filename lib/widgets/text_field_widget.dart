import 'package:flutter/material.dart';

import '../constants.dart';

class TextFieldWidget extends StatelessWidget {
  final double height;
  final double width;
  final String hintText;
  TextFieldWidget({required this.height, required this.width, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 1,color: AppColorAssets.appGreyColor),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColorAssets.appGreyColor,
          ),
          hintText: hintText,
          hintStyle: AppTextStyleAssets.textFieldWidgetStyle,
        ),
      ),
    );
  }
}