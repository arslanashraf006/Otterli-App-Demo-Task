import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../all_review_filter_screen/all_reviews_filter_screen.dart';
import '../../../services/reviews_services.dart';
import '../../../widgets/horizontal_sized_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../widgets/elevated_btn_widget.dart';
import '../../../widgets/vertical_sized_widget.dart';

class AllReviewsWidget extends StatefulWidget {
  final int id3;
  AllReviewsWidget(this.id3);

  @override
  State<AllReviewsWidget> createState() => _AllReviewsWidgetState();
}

class _AllReviewsWidgetState extends State<AllReviewsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ReviewsServices>(context,listen: false).getReviewData();
    super.initState();
  }
  int a=0;

  void startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(
      isDismissible: false,
     // enableDrag: false,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),),
        ),

        context: ctx,
        builder: (builder){
          return Container(
            height: MediaQuery.of(ctx).size.height*0.6,
            //height: 450.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
              decoration:  const BoxDecoration(
                  color: AppColorAssets.appWhiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0))),
              child: GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: AllReviewsFilterScreen(child: IconButton(
                  onPressed: () => Navigator.pop(ctx),
                  icon: const Icon(Icons.close,
                    color: AppColorAssets.appDataColor,
                  ),
                ),),
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
        return Column(
          children: [
            VerticalSizedWidget(
              screenSize.height*0.023
                //20.0
            ),
            ElevatedButtonWidget(
              text: AppTextAssets.elevatedReviewsText,
            width: screenSize.width*0.55,
            height: screenSize.height* 0.07,
            // width: 232.0,
            // height: 62.0,
            ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height*0.02,
                    left: screenSize.width*0.05,
                    right: screenSize.width*0.05,
                    bottom: screenSize.height*0.01,
                    //top: 11.0,left: 15.0,right: 15.0,bottom: 6.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(AppTextAssets.totalReviewsText),
                    GestureDetector(
                      onTap: () =>startAddNewTransaction(context),
                      child: const Icon(Icons.tune),),
                  ],
                ),
              ),
               Padding(
                padding: EdgeInsets.only(
                  left: screenSize.width*0.05,
                right: screenSize.width*0.05,
                bottom: screenSize.height*0.009,
                //  left: 16.0,right: 16.0,bottom: 6.0,
                ),
                child: const Divider(),
              ),
              Expanded(
                child: Consumer<ReviewsServices>(
                    builder: (context,review,_) {
                    return review.data != null ? ListView.builder(
                      itemCount: review.data!.results!.length,
                      itemBuilder: (context, index2) {

                          if(review.isloaded){
                            if(widget.id3==review.data!.results![index2].productId){
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: screenSize.width*0.05,
                                   right: screenSize.width*0.025,
                                   top: screenSize.height*0.015,
                                   // left: 20.0, right: 25.0,top: 15.0,
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: AssetImage(AppAssets.circleAvatarImage),
                                        ),
                                        VerticalSizedWidget(
                                          screenSize.height*0.004
                                            //3.0
                                        ),
                                        Text(review.data!.results![index2].username.toString(),
                                          style: AppTextStyleAssets.reviewNameTxtStyle,
                                        ),
                                      ],
                                    ),
                                    HorizontalSizedWidget(
                                      screenSize.width*0.045,
                                    //    15.0,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        RatingBar.builder(
                                          itemBuilder: (context, _) {
                                            return const Icon(Icons.star, color: AppColorAssets.appRatingStarColor,);
                                          },
                                          onRatingUpdate: (rating) {
                                            rating=review.data!.results![index2].rating!.toDouble();
                                          },
                                          itemSize: 15.0,
                                          updateOnDrag: false,
                                          initialRating: review.data!.results![index2].rating!.toDouble(),
                                          maxRating: review.data!.results![index2].rating!.toDouble(),
                                        ),

                                        SizedBox(
                                          width: screenSize.width*0.7,
                                          //width: 250.0,
                                          child: Text(review.data!.results![index2].review.toString(),
                                            style: const TextStyle(color: AppColorAssets.appDataColor,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }
                          }

                        return Container();
                      },) : const SizedBox.shrink();
                  }
                ),
              ),
           // ],
          ],
        );
  }
}
