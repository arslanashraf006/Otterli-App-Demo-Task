import 'package:flutter/material.dart';

import '../constants.dart';
class FavoriteIconWidget extends StatefulWidget {
  const FavoriteIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}
bool _isSelected=false;
class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected=!_isSelected;
        });
      },
        child:_isSelected ?const Icon(Icons.favorite,color: AppColorAssets.appRedColor,):
    const Icon(Icons.favorite_border_outlined,color: AppColorAssets.appRedColor,)
    );
  }
}

