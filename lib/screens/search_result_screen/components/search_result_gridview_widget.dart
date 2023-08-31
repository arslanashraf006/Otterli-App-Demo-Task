import '../../../services/recommended_product_service.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../widgets/vertical_sized_widget.dart';
import '../../Detail_vendor_screen/details_1_vender_screen.dart';
import 'package:flutter/material.dart';

import '../../../services/new_product_services.dart';
import '../../../widgets/container_widget.dart';
import '../../../widgets/favorite_icon_widget.dart';

class SearchResultGridViewWidget extends StatelessWidget {
  final int ids;
  SearchResultGridViewWidget({required this.ids});

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return ids==25
    ? SizedBox(
    width: double.infinity,
    height: screenSize.height*0.61,
    //height: 500,
    child: Consumer<RecommendedProductServices>(
    builder: (context, snapshot,_) {
    if (snapshot.isloaded) {
    return GridView.builder(
        padding: EdgeInsets.only(
            bottom:  screenSize.height*0.05,
        ),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    mainAxisSpacing: 2.0,
    crossAxisSpacing: 2.0,
    crossAxisCount: 2,
    //childAspectRatio: 1/3,
    ),

    itemCount: snapshot.data!.results!.length,
    itemBuilder: (context, index) {
    return GestureDetector(
    onTap: () {
      id = snapshot.data!.results![index].id;
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context) {
    return DetailVenderScreen(snapshot.data!.results![index].id!.toInt());
    },));
    },
    child: Card(
    elevation: 1,
    color: AppColorAssets.appWhiteColor,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0)),
    child: SizedBox(
      width: screenSize.width*0.47,
    height: screenSize.height*0.2,
    //width: 170,
    child: Stack(
    children: [
     Padding(
    padding: EdgeInsets.only(
      left: screenSize.width*0.35,
        top: screenSize.height*0.01,
        // left: 140,
        // top: 8.0,
    ),
    child: const FavoriteIconWidget(),
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Padding(
    padding: EdgeInsets.only(
      top: screenSize.height*0.013,
    //top: 12.0,
    ),
    child: Center(
    child: SizedBox(
      height: screenSize.height*0.1,
    width: screenSize.width*0.15,
    // height: 65,
    // width: 77,
    child: Image.network(
    snapshot.data!.results![index]
        .imageUrl.toString()))),
    ),
     Padding(
    padding: EdgeInsets.only(
      top: screenSize.height*0.006,
    left: screenSize.width*0.025,
    // top: 8.0,
    //     left: 10.0,
    ),
    child: Text(snapshot.data!.results![index].name.toString(),
    overflow: TextOverflow.ellipsis,
    style: AppTextStyleAssets
        .recommendTextHeadStyle,),
    ),
    Padding(
    padding: EdgeInsets.only(
      left: screenSize.width*0.02,
    right: screenSize.width*0.02,
    top: screenSize.height*0.0058
    // left: 10.0,
    //     right: 10.0,
    //     top: 7.0,
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment
        .spaceBetween,
    children: [
      SizedBox(
        height: screenSize.height*0.018,
        width: screenSize.width * 0.1,
        // height: 17,
        // width: 40,
        child: ListView.builder(
            itemCount: snapshot.data!.results![index].vendors!.length,
            itemBuilder: (context,num) {
              return Text('\$${snapshot.data!.results![index].vendors![num].price!.price}',

                  style: AppTextStyleAssets.recommendTextBodyStyle);
            }
        ),
      ),
    Row(children: [
    const Icon(Icons.star_half,
    color: AppColorAssets.appRatingStarColor,
    size: 14,),
      Text(snapshot.data!.results![index].reviews!.avgRating.toString(),style: AppTextStyleAssets.recommendTextBodyStyle),
    ],),
    ],
    ),
    ),
      Padding(
        padding: EdgeInsets.only(
          left: screenSize.width*0.02,
            top: screenSize.height*0.009
            //top: 10.0,
            // left: 8,
            // bottom: 12.0,
        ),
        child: SizedBox(
          height: screenSize.height*0.021,
          width: screenSize.width*0.4,
          // height: 20,
          // width: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.results![index].vendors!.length,
              itemBuilder: (context,numb) {
                return Row(
                  children: [
                    snapshot.data!.results![index].vendors![numb].vendor!.isEmpty
                        ? Container()
                        : ContainerWidget(text: snapshot.data!.results![index].vendors![numb].vendor!.toString(),
                      // width: screenSize.width*0.12,
                      // height: screenSize.height*0.02,
                      // width: 36,
                      // height: 18,
                    ),
                    SizedBox(width: screenSize.width*0.01,),


                  ],
                );
              }
          ),
        ),
      ),
    ],
    ),
    ],
    ),
    ),
    ),
    );
    }
    );
    }
    return const Center(child: CircularProgressIndicator());
    }
    ),

    )


        : SizedBox(
          width: double.infinity,
          height: screenSize.height*0.61,
          child: Consumer<NewProductServices>(
              builder: (context, snapshot,_) {
                if (snapshot.isLoading) {
                  return GridView.builder(
                      padding: EdgeInsets.only(
                          bottom:  screenSize.height*0.05
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 2.0,
                        crossAxisSpacing: 2.0,
                        crossAxisCount: 2,
                        //childAspectRatio: 1/3,
                      ),

                      itemCount: snapshot.data!.results!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            id = snapshot.data!.results![index].id;
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return DetailVenderScreen(snapshot.data!.results![index].id!.toInt());
                                },));
                          },
                          child: Card(
                            elevation: 1,
                            color: AppColorAssets.appWhiteColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            child: SizedBox(
                              width: screenSize.width*0.47,
                              height: screenSize.height*0.2,
                              child: Stack(
                                children: [
                                   Padding(
                                    padding: EdgeInsets.only(
                                      left: screenSize.width*0.35,
                                      top: screenSize.height*0.01,
                                        // left: 140,
                                        // top: 8.0,
                                    ),
                                    child: const FavoriteIconWidget(),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: screenSize.height*0.013,
                                          //top: 12.0,
                                        ),
                                        child: Center(
                                            child: SizedBox(
                                                height: screenSize.height*0.1,
                                                width: screenSize.width*0.15,
                                                // height: 65,
                                                // width: 77,
                                                child: Image.network(
                                                    snapshot.data!.results![index]
                                                        .imageUrl.toString()))),
                                      ),
                                       Padding(
                                        padding: EdgeInsets.only(
                                          top: screenSize.height*0.006,
                                          left: screenSize.width*0.025,
                                            // top: 8.0, left: 10.0
                                        ),
                                        child: Text(snapshot.data!.results![index].name.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyleAssets
                                              .recommendTextHeadStyle,),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: screenSize.width*0.02,
                                          right: screenSize.width*0.02,
                                            top: screenSize.height*0.0058,
                                           // left: 10.0, right: 10.0, top: 7.0
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: screenSize.height*0.018,
                                              width: screenSize.width * 0.1,
                                              // height: 17,
                                              // width: 40,
                                              child: ListView.builder(
                                                  itemCount: snapshot.data!.results![index].vendors!.length,
                                                  itemBuilder: (context,num) {
                                                    return Text('\$${snapshot.data!.results![index].vendors![num].price!.price}',

                                                        style: AppTextStyleAssets.recommendTextBodyStyle);
                                                  }
                                              ),
                                            ),
                                            Row(children: const [
                                              Icon(Icons.star_half,
                                                color: AppColorAssets.appRatingStarColor,
                                                size: 14,),
                                              Text('0.0', style: AppTextStyleAssets
                                                  .recommendTextBodyStyle,),
                                            ],)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: screenSize.width*0.02,
                                            top: screenSize.height*0.009
                                            //top: 10.0, left: 8, bottom: 12.0,
                                        ),
                                        child: Row(
                                          children:  [
                                            for(int ind=0;ind<snapshot.data!.results![index].vendors!.length;ind++)...[
                                                 ContainerWidget(
                                                  // width: screenSize.width*0.12,
                                                  // height: screenSize.height*0.023,
                                                  // width: 36,
                                                  // height: 18,
                                                  text: snapshot.data!.results![index].vendors![ind].vendor!.toString(),
                                                ),

                                            ],
                                            // ContainerWidget(text: 'Tesco',
                                            //   width: screenSize.width*0.1,
                                            //   height: screenSize.height*0.023,
                                            //   // width: 36,
                                            //   // height: 18,
                                            // ),
                                            // SizedBox(width: screenSize.width*0.01,),
                                            // ContainerWidget(text: 'Aldi',
                                            //   width: screenSize.width*0.06,
                                            //   height: screenSize.height*0.023,
                                            //   // height: 18,
                                            //   // width: 23,
                                            // ),
                                            // SizedBox(width: screenSize.width*0.01,),
                                            // ContainerWidget(text: 'Asda',
                                            //   width: screenSize.width*0.1,
                                            //   height: screenSize.height*0.023,
                                            //   // width: 36,
                                            //   // height: 18,
                                            // ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }
          ),
        );

  }
}
