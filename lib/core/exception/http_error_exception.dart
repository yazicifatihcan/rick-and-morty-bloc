import '../i10n/i10n.dart';

class AppException implements Exception {
  String? message;

  AppException([this.message]);

  @override
  String toString() {
    message ??= AppLocalization.getLabels.defaultErrorMessage;
    return message!;
  }
}

class ServerError extends AppException {
  ServerError() : super(AppLocalization.getLabels.serverErrorMessage);
}

class InternetError extends AppException {
  InternetError() : super(AppLocalization.getLabels.noInternetErrorMessage);
}

class UnauthorizedError extends AppException {
  UnauthorizedError() : super(AppLocalization.getLabels.unauthorizedErrorMessage);
}
