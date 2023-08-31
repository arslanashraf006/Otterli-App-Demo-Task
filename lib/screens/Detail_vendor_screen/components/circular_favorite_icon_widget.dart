import '../../../constants.dart';
import '../../../widgets/favorite_icon_widget.dart';
import 'package:flutter/material.dart';

class CircularFavoriteIconWidget extends StatelessWidget {
  const CircularFavoriteIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
          border: Border.all(color: AppColorAssets.appRedColor),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: const FavoriteIconWidget(),
    );
  }
}
