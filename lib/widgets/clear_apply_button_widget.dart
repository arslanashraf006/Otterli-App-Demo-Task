import 'package:flutter/material.dart';

import '../constants.dart';
import 'horizontal_sized_widget.dart';

class ClearApplyButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const ClearApplyButtonWidget({Key? key,required  this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenSize.width*0.4,
            height: screenSize.height*0.07,
            // width: 145,
            // height: 55,
            child: TextButton(onPressed: onPressed,
              style: ConstantButtonStyle.clearButtonStyle,
              child: const Text(AppTextAssets.clearBtnText),
            ),
          ),
          HorizontalSizedWidget(
            screenSize.width*0.02
              //10.0
          ),
          SizedBox(
            width: screenSize.width*0.4,
            height: screenSize.height*0.07,
            // width: 145,
            // height: 55,
            child: ElevatedButton(onPressed: (){},
              style: ConstantButtonStyle.applyButtonStyle, child: const Text(AppTextAssets.applyBtnText),
            ),
          ),
        ]
    );
  }
}
