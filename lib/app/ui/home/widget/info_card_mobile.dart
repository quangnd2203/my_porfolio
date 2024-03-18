import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';

class InfoCardMobile extends StatelessWidget {
  const InfoCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          Image.asset(AppImages.png('demo_avatar'), width: 84, height: 84,),
          
        ],
      ),
    );
  }
}
