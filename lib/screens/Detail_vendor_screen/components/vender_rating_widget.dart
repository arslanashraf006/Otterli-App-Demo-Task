import '../../../constants.dart';
import '../../all_reviews_screen/all_reviews_screen.dart';
import '../../../widgets/vertical_sized_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VendorRatingWidget extends StatelessWidget {
  final String ratings;
  final String reviews;
  final int id1;
  VendorRatingWidget({required this.ratings,required this.reviews,required this.id1});

  double rating = 0;
  void startAddNewTransaction(BuildContext ctx,int reviewId){
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
                child: AllReviews(
                  id2: id1,
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
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            VerticalSizedWidget(10),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.star_half,
                  size: 20,
                  color: AppColorAssets.appRatingStarColor,
                ),
                Text(
                  '$ratings  ${AppTextAssets.appRatingText}',
                  style: AppTextStyleAssets.vendorRatingWidgetTxtStyle,
                )
              ],
            ),
            Row(
              children: <Widget>[
                 Text(
                  '$reviews ${AppTextAssets.appReviewText}',
                  style: AppTextStyleAssets.vendorRatingWidgetTxtStyle,
                ),
                TextButton(
                    onPressed: () =>startAddNewTransaction(context,id1),
                    child: const Text(
                      AppTextAssets.seeAllText,
                      style: AppTextStyleAssets.vendorRtgWgtSeeAllTxtStyle,
                    ),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: <Widget>[
            const Text(
              AppTextAssets.giveRatingText,
              style: AppTextStyleAssets.vendorRatingWidgetTxtStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            RatingBar.builder(
              itemBuilder: (context, _) {
                return const Icon(Icons.star, color: AppColorAssets.appRatingStarColor,);
              },
              onRatingUpdate: (rating) {
                this.rating=rating;
              },
              itemPadding: EdgeInsets.zero,
              itemSize: 20.0,
              updateOnDrag: true,
              minRating: 1.0,
            ),
          ],
        ),
      ],
    );
  }
}