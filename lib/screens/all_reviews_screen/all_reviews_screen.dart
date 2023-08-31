import 'components/all_reviews_widget.dart';
import '../../widgets/botton_container_widget.dart';
import '../../widgets/vertical_sized_widget.dart';
import 'package:flutter/material.dart';

class AllReviews extends StatelessWidget {
  final Widget child;
  final int id2;
  const AllReviews({required this.child,required this.id2});

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return  SingleChildScrollView(
      child: SafeArea(
          child: Column(
            children: [
              VerticalSizedWidget(
                screenSize.height*0.033
                  //33.0
            ),
              BottomContainerWidget(
                closeIcon: child,
                child: AllReviewsWidget(id2),),
            ],
          ),

      ),
    );
  }
}
