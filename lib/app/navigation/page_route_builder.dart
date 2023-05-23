import 'package:casino_test/features/characters_screen/characters_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

PageRoute goToPageWithOutAnimation(Widget screen, RouteSettings settings) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    settings: settings,
    transitionDuration: const Duration(milliseconds: 0),
    reverseTransitionDuration: const Duration(milliseconds: 0),
  );
}

PageRoute goToPage(Widget screen, RouteSettings settings) {
  switch (defaultTargetPlatform) {
    case TargetPlatform.iOS:
      return CupertinoPageRoute(
        builder: (BuildContext context) => screen,
        settings: settings,
      );
    default:
      return goToPageWithOutAnimation(
        screen,
        settings,
      );
  }
}

PageRoute returnUnknownPageRoute(RouteSettings settings) {
  return goToPage(CharactersScreen(), settings);
}
