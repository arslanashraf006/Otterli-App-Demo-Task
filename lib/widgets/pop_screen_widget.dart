import 'package:flutter/material.dart';
class PopScreenWidget extends StatelessWidget {
 final String title;
 PopScreenWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.arrow_back_ios_new_outlined),
        Text(title),
      ],
    );
  }
}
