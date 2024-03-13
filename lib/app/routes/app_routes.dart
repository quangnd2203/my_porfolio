part of './app_pages.dart';

// abstract class Routes {
//   static const String HOME = '/';
//   static const String ACCOUNT = '/account';
// }

enum Routes{
  home('/'),
  account('/account'),
  unknown('/unknown');
  const Routes(this.route);
  final String route;
}