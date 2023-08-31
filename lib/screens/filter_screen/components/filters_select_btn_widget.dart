import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'selection_button_widget.dart';
import '../../../widgets/vertical_sized_widget.dart';
class FilterSelectBtnWidget extends StatelessWidget {
  const FilterSelectBtnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: screenSize.width *0.05,
          right: screenSize.width *0.05,
          // left: 15,
          // right: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SelectionButtonWidget(text: AppTextAssets.tescoText,),
              SelectionButtonWidget(text: AppTextAssets.aldiText,),
              SelectionButtonWidget(text: AppTextAssets.asdaText,),
            ],),
          VerticalSizedWidget(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SelectionButtonWidget(text: AppTextAssets.sainsburyText,),
              SelectionButtonWidget(text: AppTextAssets.lidlText,),
              SelectionButtonWidget(text: AppTextAssets.ocadoText,),
            ],),
        ],
      ),
    );
  }
}
