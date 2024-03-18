import 'package:flutter/material.dart';

import '../../widgets/responsive_screen.dart';

class HomeAbout extends StatelessWidget with ResponsiveScreen {
  const HomeAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return buildResponsiveScreen(context);
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      ],
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    // TODO: implement buildMobile
    throw UnimplementedError();
  }

  @override
  Widget buildTablet(BuildContext context) {
    // TODO: implement buildTablet
    throw UnimplementedError();
  }
}
