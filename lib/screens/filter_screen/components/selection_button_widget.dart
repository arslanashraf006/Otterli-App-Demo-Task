import 'package:flutter/material.dart';

import '../../../constants.dart';

class SelectionButtonWidget extends StatefulWidget {
  final String text;
  SelectionButtonWidget({required this.text});

  @override
  State<SelectionButtonWidget> createState() => _SelectionButtonWidgetState();
}

class _SelectionButtonWidgetState extends State<SelectionButtonWidget> {
  bool _hasBeenPressed=false;
  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height*0.05,
      width: screenSize.width*0.28,
      // height: 42,
      // width: 110,
      child: ElevatedButton(
        onPressed: (){
          setState(() {
            _hasBeenPressed=!_hasBeenPressed;
          });
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: _hasBeenPressed ? AppColorAssets.vendorCategoryColor : AppColorAssets.appWhiteColor,
          side: const BorderSide(color: AppColorAssets.vendorCategoryColor,width: 1),
          shape:  RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(45.0),
          ),
        ),
        child: Text(widget.text,
          style: TextStyle(
            color: _hasBeenPressed ? AppColorAssets.appWhiteColor : AppColorAssets.vendorCategoryColor,
          ),
        ),
      ),
    );
  }
}

