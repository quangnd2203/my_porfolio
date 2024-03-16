import 'package:flutter/material.dart';

mixin ResponsiveScreen{

  Widget buildResponsiveScreen(BuildContext context){
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      if(constraints.maxWidth <= 480)
        return buildMobile(context);
      else if(constraints.maxWidth < 1125)
        return buildTablet(context);
      return buildDesktop(context);
    });
  }

  Widget buildMobile(BuildContext context);
  Widget buildTablet(BuildContext context);
  Widget buildDesktop(BuildContext context);
}
