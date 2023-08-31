import '../../services/product_detail_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'components/detail_btm_container_widget.dart';
import '../../widgets/pop_screen_widget.dart';
import '../../widgets/vertical_sized_widget.dart';
class DetailVenderScreen extends StatelessWidget {
  final int ids;
  DetailVenderScreen(this.ids);

  // @override
  @override
  Widget build(BuildContext context) {
   // print(id);
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
    backgroundColor: AppColorAssets.appWhiteColor,
    body: SingleChildScrollView(
    child: SafeArea(
    child:  Column(
    children: [
    Image.asset(AppAssets.navImage, width: double.infinity,),
    VerticalSizedWidget(
      screenSize.height*0.015
        //15.0
    ),
    Padding(
    padding: EdgeInsets.only(
      left: screenSize.width*0.04
        //left: 20,
    ),
    child: GestureDetector(
    onTap: () => Navigator.of(context).pop(),
    child: PopScreenWidget(title: AppTextAssets.detailScreenBackText)),
    ),
    FutureBuilder(
      future: ProductDetailServices().getProductDetaildata(ids),
    builder: (context,snapshot) {
      if(snapshot.hasData) {
          return Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: screenSize.width*0.89,
                    height: 350,
                    child: Image.network(snapshot.data!.imageUrl.toString(),
                      fit: BoxFit.cover,
                      // width: 350,
                      //height: 350,
                      ),
                  ),
                  Positioned(
                    top: screenSize.height*0.4,
                    left:screenSize.width*0.045,
                    bottom: screenSize.height*0.01,
                    // top: 300,
                    // left: 25,
                    // bottom: 15,
                    child: IconButton(
                      onPressed: (() {}),
                      icon: const Icon(
                        Icons.info,
                        size: 14,
                        color: AppColorAssets.appGreyColor,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          );
    }else{
        return SizedBox(
          width: screenSize.width*0.89,
          // width: 350,
          height: 350,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }


    }
    ),
    DetailBottomContainerWidget(ids),
    ],
    ),
    ),
    ),
    );
  }
}


