import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../screens/Detail_vendor_screen/details_1_vender_screen.dart';
import '../services/new_product_services.dart';
import '../services/product_detail_services.dart';
import 'container_widget.dart';
import 'favorite_icon_widget.dart';

class CardWidget extends StatefulWidget {

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<NewProductServices>(context,listen: false).getNewProductdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Column(
      children: [
           Consumer<NewProductServices>(
             builder: (context,snapshot,_) {
               if(snapshot.isLoading){
                 return Column(
                   children: [
                     for(int index2 =0; index2 < snapshot.data!.results!.length ; index2++)...[
                       GestureDetector(
                             onTap: () {
                               id=snapshot.data!.results![index2].id;
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => DetailVenderScreen(snapshot.data!.results![index2].id!.toInt()),));
                             },
                             child: Card(
                               elevation: 1,
                               color: AppColorAssets.appWhiteColor,
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                               child: SizedBox(
                                 height:screenSize.height*0.15,
                                 width: screenSize.width*0.9,

                                 // width: 379,
                                 // height: 122,
                                 child: Stack(
                                   children: [
                                      Padding(
                                       padding: EdgeInsets.only(left: screenSize.width*0.8,top: screenSize.height*0.01,),
                                       child: const FavoriteIconWidget(),
                                     ),
                                     Row(
                                       children: [
                                         SizedBox(
                                           height: screenSize.height*0.25,
                                             width: screenSize.width*0.25,
                                             // height: 110,
                                             // width: 110,
                                             child: Image.network(snapshot.data!.results![index2].imageUrl.toString())),
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Padding(
                                               padding: EdgeInsets.only(
                                                 top: screenSize.height*0.01,
                                                   //top: 9.0
                                               ),
                                               child: SizedBox(
                                                 height: screenSize.height*0.07,
                                                 width: screenSize.width*0.55,
                                                 // height: 60,
                                                 // width: 200,
                                                 child: Text(snapshot.data!.results![index2].name.toString(),
                                                     style: AppTextStyleAssets.productBodyHeadingStyle),
                                               ),
                                             ),
                                             // SizedBox(
                                             //   // height: 39,
                                             //   // width: 220,
                                             //   child: Padding(
                                             //     padding: const EdgeInsets.only(top: 0.0),
                                             //     child: Text('',
                                             //       style: ConstantTextStyle.productBodyDetailTextStyle,),
                                             //   ),
                                             // ),
                                             Padding(
                                               padding: EdgeInsets.only(
                                                 top: screenSize.height*0.03,
                                                   //top:15.0,
                                               ),
                                               child: Row(
                                                 children: [
                                                   for(int index3 = 0; index3 < snapshot.data!.results![index2].vendors!.length; index3++)...[
                                                     Text('\$${snapshot.data!.results![index2].vendors![index3].price!.price}',style: AppTextStyleAssets.productBodyPriceStyle,),
                                                   ],

                                                   Padding(
                                                     padding:  EdgeInsets.only(
                                                       left: screenSize.width*0.03
                                                     //    left: 12.0
                                                     ),
                                                     child: Row(
                                                       children: const [
                                                         Icon(Icons.star_half,color: AppColorAssets.appRatingStarColor,size: 14,),
                                                         Text('0.0',style: AppTextStyleAssets.productBodyRatingStyle,),
                                                       ],
                                                     ),
                                                   ),
                                                    for(int ind=0;ind<snapshot.data!.results![index2].vendors!.length;ind++)...[
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                          left: screenSize.width*0.28,
                                                          //  left: 30.0
                                                        ),
                                                        child: ContainerWidget(
                                                          // width: screenSize.width*0.12,
                                                          // height: screenSize.height*0.03,
                                                          // width: 36,
                                                          // height: 18,
                                                          text: snapshot.data!.results![index2].vendors![ind].vendor!.toString(),
                                                        ),
                                                      ),
                                                    ],

                                                   //  SizedBox(width: screenSize.width*0.01,),
                                                   //  ContainerWidget(text: 'text2',
                                                   //   width: screenSize.width*0.09,
                                                   //   height: screenSize.height*0.025,
                                                   //   // height: 18,
                                                   //   // width: 23,
                                                   // ),
                                                   //  SizedBox(width: screenSize.width*0.01,),
                                                   //  ContainerWidget(text: 'text3',
                                                   //   width: screenSize.width*0.09,
                                                   //   height: screenSize.height*0.025,
                                                   //   // height: 18,
                                                   //   // width: 32,
                                                   // ),
                                                 ],
                                               ),
                                             )
                                           ],
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                     ]
                   ],
                 );
               }
               return Center(child: CircularProgressIndicator(),);
             }
           ),
        ],
    );

  }
}



