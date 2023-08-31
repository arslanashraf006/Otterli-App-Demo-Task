import '../../constants.dart';
import '../../widgets/botton_container_widget.dart';
import 'components/filters_select_btn_widget.dart';
import '../../widgets/vertical_sized_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/clear_apply_button_widget.dart';
import '../../widgets/radio_button_widget.dart';

class FiltersScreen extends StatelessWidget {
  final Widget child;
  FiltersScreen({required this.child});
  List items = AppTextAssets.item;

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: [
                Stack(
                  textDirection: TextDirection.ltr,
                  clipBehavior: Clip.none,
                  children: [
                   BottomContainerWidget(
                       closeIcon: child,
                       child: Column(
                     children: [
                       VerticalSizedWidget(
                         screenSize.height*0.07,
                           //60.0
                       ),
                       RadioButtonWidget(items: items,),
                       Padding(
                         padding: EdgeInsets.only(
                           right: screenSize.width*0.7,
                             //right: 250,
                         ),
                         child: const Text(AppTextAssets.filterText,style: AppTextStyleAssets.filterSrnFilterHeadingStyle,),
                       ),
                       VerticalSizedWidget(
                         screenSize.height*0.009,
                           //8
                       ),
                       Padding(
                         padding: EdgeInsets.only(
                           left: screenSize.width*0.05,
                             right: screenSize.width*0.05
                             // left: 18,
                             // right: 18,
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: const [
                             Text(AppTextAssets.superMarketText,style: AppTextStyleAssets.filterSrnSuperMrktStyle,),
                             Text(AppTextAssets.resetText,style: AppTextStyleAssets.filterSrnResetStyle,
                             ),
                           ],
                         ),
                       ),
                       VerticalSizedWidget(
                         screenSize.height*0.025,
                           //18
                       ),
                       const FilterSelectBtnWidget(),
                       VerticalSizedWidget(
                         screenSize.height*0.09,
                       //    70
                       ),
                       ClearApplyButtonWidget(
                         onPressed: () => Navigator.of(context).pop(),
                       ),
                       VerticalSizedWidget(
                         screenSize.height*0.035,
                       //    25
                       ),
                     ],
                   )),
                     Padding(
                      padding: EdgeInsets.only(
                        top: screenSize.height*0.035,
                        left: screenSize.width*0.08,
                        //left: 33,top: 25,
                      ),
                      child: const Text(AppTextAssets.sortByText,
                        style: AppTextStyleAssets.sortBy,
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ),
    );
  }
}
