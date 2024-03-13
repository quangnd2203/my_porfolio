import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/home/home_screen.dart';
import '../ui/unknown/unknown_screen.dart';
import 'app_pages.dart';
import 'app_route_path.dart';

class AppRouteDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  AppRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>();
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRoutePath _selectedPath = AppRoutePath.home();

  @override
  AppRoutePath get currentConfiguration => _selectedPath;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (BuildContext context) => const UnknownScreen(),
        );
      },
      onPopPage: (Route<dynamic> route, dynamic result) {
        if (!route.didPop(result)) {
          return false;
        }
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    _selectedPath = configuration;
    notifyListeners();
  }

  Page<dynamic>? getPage() {
    if (_selectedPath.isAccountPage) {
      return MaterialPage(
          child: const HomeScreen(text: 'account'), name: Routes.account.route, key: ValueKey(Routes.account.route));
    }
    if (_selectedPath.unKnown) {
      return MaterialPage(
          child: const UnknownScreen(), name: Routes.unknown.route, key: ValueKey(Routes.unknown.route));
    }
  }
}
