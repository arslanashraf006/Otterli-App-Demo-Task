import 'package:flutter/material.dart';

import '../constants.dart';

class FloatingActionBtnWidget extends StatelessWidget {
//   final VoidCallback onPressed;
// FloatingActionBtnWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppColorAssets.appGreenColor,
      child: const Icon(Icons.search),
    );
  }
}