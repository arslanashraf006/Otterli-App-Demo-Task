import '../constants.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final String text;
  // final double width;
  // final double height;
  const ContainerWidget({
    Key? key,required this.text,
    // required this.width,
    // required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      // height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
            width: 1,
            color: AppColorAssets.vendorCategoryColor
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0,right: 4.0,top: 1.0,bottom: 1.0),
        child: Center(
          child: Text(text,
              textAlign: TextAlign.center,
              style: AppTextStyleAssets.containerWidgetTextStyle),
        ),
      ),
    );
  }
}