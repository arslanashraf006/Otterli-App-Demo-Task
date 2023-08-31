import 'package:flutter/material.dart';

import '../constants.dart';


class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  ElevatedButtonWidget({required this.text,required this.width,required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorAssets.appGreenColor,
          shape:  RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(30.0),
          ),
        ),
        child: Text( text, style: const TextStyle(fontSize: 18.0),),
      ),
    );
  }
}
