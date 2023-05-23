import 'package:casino_test/app/enums/type_enum.dart';
import 'package:casino_test/app/navigation/route_factory.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on String? {
  Color colorBasedOnStatus() {
    if (this == null) return Theme.of(MyRouteFactory.context).colorScheme.onSecondary;
    if (this == CharacterStatusEnum.Alive.name) {
      return Theme.of(MyRouteFactory.context).colorScheme.secondary;
    } else if (this == CharacterStatusEnum.Dead.name) {
      return Theme.of(MyRouteFactory.context).colorScheme.error;
    } else {
      return Theme.of(MyRouteFactory.context).colorScheme.onPrimary;
    }
  }

  String formatCreatedTime() {
    if (this == null) return '';
    DateTime parsedDateFormat = DateFormat("yyyy-MM-dd").parseUTC(this!);
    return DateFormat('dd.MM.yyyy').format(parsedDateFormat);
  }
}
