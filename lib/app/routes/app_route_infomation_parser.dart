import 'package:flutter/material.dart';

import 'app_route_path.dart';
import 'app_routes.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {

  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final Uri uri = routeInformation.uri;
    if (uri.pathSegments.isEmpty) {
      return AppRoutePath.home();
    }
    if (uri.pathSegments.length == 1) {
      final String pathName = uri.pathSegments.elementAt(0);
      if(Routes.values.map((Routes e) => e.route).contains('/$pathName')){
        return AppRoutePath.otherPage('/$pathName');
      }
    }
    return AppRoutePath.unknown();
  }

  // @override
  // RouteInformation restoreRouteInformation(AppRoutePath configuration) {
  //   if(configuration.unKnown){
  //     return RouteInformation(uri: Uri.parse(Routes.unknown.route));
  //   }
  //   return RouteInformation(uri: Uri.parse('${configuration.path}' ?? '/'));
  // }
}
