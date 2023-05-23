import 'package:casino_test/app/libs/network/connection_service.dart';
import 'package:casino_test/app/navigation/route.dart';
import 'package:casino_test/app/navigation/route_factory.dart';
import 'package:casino_test/core/exception/http_error_exception.dart';
import 'package:casino_test/core/i10n/i10n.dart';
import 'package:casino_test/features/splash_screen/bloc/splash_event.dart';
import 'package:casino_test/features/splash_screen/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final ConnectionService connectionService;
  SplashBloc({required this.connectionService}) : super(InitialSplashPageState()) {
    on<InitializeAppEvent>(initializeApp);
  }

  Future<void> initializeApp(
    InitializeAppEvent event,
    Emitter<SplashState> emit,
  ) async {
    emit(LoadingSplashPageState());
    try {
      await Future.delayed(Duration(seconds: 2));
      await isInternetAvailable();
      Navigator.pushNamedAndRemoveUntil(MyRouteFactory.context, MainScreensRoutes.characterScreen, (route) => false);
    } catch (e) {
      emit(InitializingErrorSplashPageState(message: e.toString()));
    }
  }

  Future<bool> isInternetAvailable() async {
    final isInternetAvailable = await ConnectionService.instance.isInternetAvailable();
    if (!isInternetAvailable) throw AppException(AppLocalization.getLabels.noInternetErrorMessage);
    return isInternetAvailable;
  }
}
