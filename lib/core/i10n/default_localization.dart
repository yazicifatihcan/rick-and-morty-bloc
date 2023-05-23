import 'package:flutter/material.dart' show ValueNotifier, Locale;
import '../../app/enums/type_enum.dart';
import '../../app/libs/locale_manager/locale_manager.dart';
import 'lan/en.dart';

const kDefaultLocal = Locale('en');

Map<String, AppLocalizationLabel> supportedLocalization = {
  'en': EnLocalization(),
};

List<Locale> get getSupportedLocalList => List.generate(
      supportedLocalization.length,
      (index) => Locale(
        supportedLocalization.keys.elementAt(index),
      ),
    );

final ValueNotifier<Locale> localeValueNotifier = ValueNotifier(_getDefaultKeyFromCache);

Locale get _getDefaultKeyFromCache {
  final lan = Locale(
    LocaleManager.instance.getStringValue(CacheKey.languageCode) ?? kDefaultLocal.languageCode,
  );
  return lan;
}

abstract class AppLocalizationLabel {
  const AppLocalizationLabel();

  String get localizationTitle;

  String get lanCode;

  String get defaultErrorMessage;

  String get serverErrorMessage;

  String get noInternetErrorMessage;

  String get unauthorizedErrorMessage;

  String get unknown;

  String get tryAgain;

  String get teleportBack;

  String get areYouLost;

}
