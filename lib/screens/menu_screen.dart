import '../constants.dart';
import '../widgets/vertical_sized_widget.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Image.asset(AppAssets.navImage, width: double.infinity,),
          VerticalSizedWidget(280),
          const Center(child: Text(AppTextAssets.menuScreenText),),
        ],
      ),
    );
  }
}