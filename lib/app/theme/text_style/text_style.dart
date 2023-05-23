import 'package:casino_test/app/extensions/widget_scale_extension.dart';
import 'package:flutter/material.dart';

import '../../navigation/route_factory.dart';

TextStyle get s12W500Dark => Theme.of(MyRouteFactory.context).textTheme.headline1!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 12.horizontalScale,
    );

TextStyle get s12W700Dark => Theme.of(MyRouteFactory.context).textTheme.headline1!.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 12.horizontalScale,
    );

TextStyle get s16W400Dark => Theme.of(MyRouteFactory.context).textTheme.bodyText1!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16.horizontalScale,
    );

TextStyle get s20W700Dark => Theme.of(MyRouteFactory.context).textTheme.headline5!.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 20.horizontalScale,
    );


TextStyle get s26W700Dark => Theme.of(MyRouteFactory.context).textTheme.headline6!.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 26.horizontalScale,
    );


