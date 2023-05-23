import 'package:flutter/cupertino.dart';
import 'page_route_builder.dart';
import 'route.dart';

class MyRouteFactory {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final MyRouteFactory _instance = MyRouteFactory._();

  final main = _RouteGenerate(mainRoutesMap);


  MyRouteFactory._();

  static MyRouteFactory get instance => _instance;

  static BuildContext get context => MyRouteFactory.instance.navigatorKey.currentContext!;

  Future<void> restartApp() async =>
      await navigatorKey.currentState!.pushNamedAndRemoveUntil(MainScreensRoutes.init, (_) => false);
}

class _RouteGenerate {
  final Map<String, PageRouteFun> map;

  _RouteGenerate(this.map);

  Route<dynamic>? onGenerateRoute(RouteSettings setting) {
    final _map = map[setting.name] ?? returnUnknownPageRoute;
    return _map.call(setting);
  }
}
