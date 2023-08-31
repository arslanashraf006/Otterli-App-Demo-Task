import 'package:flutter/material.dart';

import '../constants.dart';

class BottomContainerWidget extends StatelessWidget {
  final Widget child;
  final Widget closeIcon;
  BottomContainerWidget({required this.child,required this.closeIcon});

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: screenSize.height*0.87,
      //height: 670,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColorAssets.appWhiteColor.withOpacity(1.0),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: screenSize.width*0.85,
            right: screenSize.width*0.040,
            top: screenSize.height*0.02,
            // left: 330,
            // right: 40,
            // top: 5,
            child: closeIcon,
          ),
          child,
        ],
      ),
    );
  }
}
