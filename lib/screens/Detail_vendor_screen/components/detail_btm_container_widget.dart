import '../../../services/product_detail_services.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import 'category_vender_widget.dart';
import '../../../widgets/elevated_btn_widget.dart';

import 'circular_favorite_icon_widget.dart';
import 'vender_rating_widget.dart';
import '../../../widgets/vertical_sized_widget.dart';
import 'package:flutter/material.dart';
class DetailBottomContainerWidget extends StatelessWidget {
  final int id5;
  DetailBottomContainerWidget(this.id5);

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    //Provider.of<ProductDetailServices>(context,listen: false).getProductDetaildata(id5);
    return Container(
      height: 533,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColorAssets.appWhiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
            ),
          ]
      ),
      child: FutureBuilder(
        future: ProductDetailServices().getProductDetaildata(id5),
        builder: (context,snapshot) {
         if(snapshot.hasData)
           {
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 24,right: 24,top: 31),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             SizedBox(
                               width: screenSize.width*0.63,
                               //width: 250,
                               height: 70,
                               child: Text(
                                 snapshot.data!.name.toString(),
                                 //overflow: TextOverflow.ellipsis,
                                 softWrap: true,
                                 style: AppTextStyleAssets.detailBtmHeadngTxtStyle,
                               ),
                             ),
                             VerticalSizedWidget(4),
                             Text(
                               '${AppTextAssets.unitsText} ${snapshot.data!.units.toString()}',
                               style: AppTextStyleAssets.detailBtmUnitTxtStyle,
                             ),
                           ],
                         ),
                         CircularFavoriteIconWidget(),
                       ],
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 24,top: 12),
                     child: Text(
                       '\$${snapshot.data!.vendors![0].price!.price}',
                       style: AppTextStyleAssets.detailBtmPriceTxtStyle,
                     ),
                   ),
                   //   ],
                   Padding(
                     padding: EdgeInsets.only(left: 24,right: 24,top: 18),
                     child: VendorRatingWidget(
                       id1: snapshot.data!.id!,
                       ratings: snapshot.data!.reviews!.avgRating.toString(),
                       reviews: snapshot.data!.reviews!.ratingCount.toString(),
                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.only(left: 24,top: 20),
                     child: Text(
                       AppTextAssets.categoryText,
                       style: AppTextStyleAssets.vendrRtgCategoryTxtStyle,
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 24,right: 24,top: 10),
                     child: Row(
                       children: [
                         Expanded(
                           child: Wrap(
                             spacing: 8.0,
                             runSpacing: 3,
                             children: [
                               for(int cat=0;cat<snapshot.data!.categories!.length;cat++)...[
                                 CategoryVenderWidget(text: snapshot.data!.categories![cat].toString(),
                                   // height: 38,
                                   // width: screenSize.width*0.23,
                                   // width: 90,
                                 ),
                                 // HorizontalSizedWidget(8),
                               ],
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 24,top: 19),
                     child: Row(
                       children: const [
                         Text(
                           AppTextAssets.productNotesText,
                           style: AppTextStyleAssets.vendrProductTxtStyle,
                         ),
                         Text(
                           AppTextAssets.seeMoreText,
                           style: AppTextStyleAssets.vendrCTSMTxtStyle,
                         ),
                       ],
                     ),
                   ),
                   // const Padding(
                   //   padding: EdgeInsets.only(left: 24,top: 8),
                   //   child: SizedBox(
                   //     width: 367,
                   //     child: Text(
                   //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                   //             'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ipsum...',
                   //     style: TextStyle(
                   //       color: Color(0xffAFAFAF)
                   //     ),
                   //     ),
                   //   ),
                   // ),
                   Padding(
                     padding: const EdgeInsets.only(left: 22,top: 30,right: 18),
                     child: ElevatedButtonWidget(text: AppTextAssets.elevatedVendorText,
                         width: screenSize.width*0.89,
                         //width: 350,
                         height: 56),
                   ),
                 ],
               );
           }
          return Container();
        }
      ),
    );
  }
}