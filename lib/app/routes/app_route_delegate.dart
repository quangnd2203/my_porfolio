import 'package:flutter/material.dart';

import '../ui/home/home_screen.dart';
import '../ui/unknown/unknown_screen.dart';
import 'app_route_path.dart';
import 'app_routes.dart';

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
      pages: <Page<dynamic>>[
        getPage(),
      ],
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

  Page<dynamic> getPage() {
    if (_selectedPath.isAccountPage) {
      return MaterialPage<dynamic>(
          child: const HomeScreen(text: 'account'), name: Routes.account.route, key: ValueKey<dynamic>(Routes.account.route));
    }
    if (_selectedPath.isHomePage) {
      return MaterialPage<dynamic>(
          child: const HomeScreen(text: 'home'), name: Routes.home.route, key: ValueKey<dynamic>(Routes.home.route));
    }
    return MaterialPage<dynamic>(child: const UnknownScreen(), name: Routes.unknown.route, key: ValueKey<dynamic>(Routes.unknown.route));
  }
}
