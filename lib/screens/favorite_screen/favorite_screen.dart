import '../../widgets/card_widget.dart';

import '../../constants.dart';
import 'package:flutter/material.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/title_widget.dart';
import '../../widgets/vertical_sized_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColorAssets.appWhiteColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
                children: [
                  Image.asset(AppAssets.navImage, width: double.infinity,),
                  VerticalSizedWidget(15.0),
                  TitleWidget(title: AppTextAssets.favoriteText, fontWeight: FontWeight.normal),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenSize.width*0.06,
                        top: screenSize.height*0.031,
                        right: screenSize.width*0.06
                        // left: 24,
                        // top: 13.0,
                        // right: 24,
                    ),
                    child: TextFieldWidget(
                        height: screenSize.height*0.06,
                        width: screenSize.width*0.872,
                        // height: 48,
                        // width: 372,
                        hintText: AppTextAssets.searchText),
                  ),
                  VerticalSizedWidget(29.0),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenSize.width*0.05,
                      right: screenSize.width*0.05,
                        // left: 20.0,
                        // right: 20.0,
                    ),
                     child: CardWidget(),
                  ),
                  VerticalSizedWidget(35),
                ],
              ),
          ),
        ),
      ),
    );
  }
}

