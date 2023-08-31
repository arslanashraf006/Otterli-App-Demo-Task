import '../../constants.dart';
import '../../widgets/botton_container_widget.dart';
import '../../widgets/clear_apply_button_widget.dart';
import '../../widgets/radio_button_widget.dart';
import '../../widgets/vertical_sized_widget.dart';
import 'package:flutter/material.dart';

class AllReviewsFilterScreen extends StatelessWidget {
  final Widget child;
  AllReviewsFilterScreen({super.key, required this.child});
  List items = AppTextAssets.itemz;

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
            children: [
              VerticalSizedWidget(
                screenSize.height*0.02
                 // 12.0,
              ),
              Stack(
                textDirection: TextDirection.ltr,
                clipBehavior: Clip.none,
                children: [
                  BottomContainerWidget(
                    closeIcon: child,
                    child: Column(
                    children: [
                      VerticalSizedWidget(
                          screenSize.height*0.04
                      //    40.0
                      ),
                      RadioButtonWidget(items: items,),
                      ClearApplyButtonWidget(onPressed: () => Navigator.of(context).pop(),),
                      VerticalSizedWidget(
                          screenSize.height*0.35
                      //    270.0
                      ),
                    ],
                  ),),
                   Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height*0.015,
                      left: screenSize.width*0.08,
                    //  left: 33,top: 12,
                    ),
                    child: const Text(AppTextAssets.sortByText,style: AppTextStyleAssets.sortBy,),
                  ),
                ],
              ),
            ],
          ),

      ),
    );
  }
}

