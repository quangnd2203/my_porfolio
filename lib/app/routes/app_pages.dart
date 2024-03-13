// ignore_for_file: always_specify_types, strict_raw_type, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/home/home_screen.dart';
import '../ui/unknown/unknown_screen.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();

  static final List<MaterialPage> pages = <MaterialPage>[
    MaterialPage(
      name: Routes.unknown.route,
      key: ValueKey(Routes.unknown.route),
      child: const UnknownScreen(),
    ),
    MaterialPage(
      name: Routes.home.route,
      key: ValueKey(Routes.home.route),
      child: const HomeScreen(text: 'home'),
    ),
    MaterialPage(
      name: Routes.account.route,
      key: ValueKey(Routes.account.route),
      child: const HomeScreen(text: 'account'),
    ),
  ];
}
