import 'package:assignment_2/constants.dart';

import '../../filter_screen/filters_screen.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text_field_widget.dart';

class SearchFilterWidget extends StatelessWidget {
   void startAddNewTransaction(BuildContext ctx){
     showModalBottomSheet(
       isDismissible: false,
         isScrollControlled: true,
       shape: const RoundedRectangleBorder(
             borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(50),
                 topRight: Radius.circular(50),),
           ),

         context: ctx,
         builder: (builder){
           return Container(
             height: MediaQuery.of(ctx).size.height*0.87,
             //height: 670.0,
             color: Colors.transparent, //could change this to Color(0xFF737373),
             //so you don't have to change MaterialApp canvasColor
             child: Container(
                 decoration: const BoxDecoration(
                     color: AppColorAssets.appWhiteColor,
                     borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(50.0),
                         topRight: Radius.circular(50.0))),
                 child: GestureDetector(
                   onTap: () {},
                   behavior: HitTestBehavior.opaque,
                   child: FiltersScreen(
                     child: IconButton(
                       onPressed: () => Navigator.pop(ctx),
               icon: const Icon(Icons.close,color: AppColorAssets.appDataColor,
               ),
             ),
                   ),
                 ),
                 ),
           );
         }
     );
     }

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: screenSize.width*0.05,
          right: screenSize.width*0.05,
          // left: 20,
          // right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFieldWidget(
              height: screenSize.height*0.06,
              width: screenSize.width*0.6,
              // height: 48,
              // width: 240,
              hintText: AppTextAssets.searchText),
          GestureDetector(
            onTap: () => startAddNewTransaction(context),
            child: Container(
              height: screenSize.height*0.06,
              width: screenSize.width*0.25,
              // height: 48,
              // width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: AppColorAssets.vendorCategoryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    spreadRadius: 0.3,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenSize.width*0.028,
                    right: screenSize.width*0.028,
                    top: screenSize.height*0.0045),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(AppTextAssets.filterButtonText,style: TextStyle(color: AppColorAssets.appWhiteColor),),
                    Icon(Icons.tune,color: AppColorAssets.appWhiteColor,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
