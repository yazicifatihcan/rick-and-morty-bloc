

import '../default_localization.dart';

class EnLocalization extends AppLocalizationLabel {
  EnLocalization();

  @override
  final String lanCode = 'en';
  
  @override
  String get localizationTitle => 'English';
  
  @override
  String get defaultErrorMessage => 'An error occured.';
  
  @override
  String get noInternetErrorMessage => 'Please check your internet connection and try again later.';
  
  @override
  String get serverErrorMessage => 'Internal server error.';
  
  @override
  String get unauthorizedErrorMessage => 'You must login before perform this action.';
  
  @override
  String get tryAgain =>"Try Again";
  
  @override
  String get unknown => 'Unknown';
  
  @override
  String get areYouLost => 'Are you lost?';
  
  @override
  String get teleportBack => 'Teleport Back';
}
