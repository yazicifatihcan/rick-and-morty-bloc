import 'package:casino_test/app/navigation/page_route_builder.dart';
import 'package:casino_test/features/characters_screen/characters_screen.dart';
import 'package:casino_test/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

typedef PageRouteFun = PageRoute Function(RouteSettings);

class MainScreensRoutes {
  static const String init = '/';
  static const String characterScreen = '/characterScreen';
}

Map<String, PageRouteFun> mainRoutesMap = {
  MainScreensRoutes.init: (_) => goToPage(SplashScreen(), _),
  MainScreensRoutes.characterScreen: (_) => goToPage(CharactersScreen(), _),
};