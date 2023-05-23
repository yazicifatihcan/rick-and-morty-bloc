import 'package:casino_test/app/libs/network/connection_service.dart';
import 'package:casino_test/features/splash_screen/bloc/splash_bloc.dart';
import 'package:casino_test/features/splash_screen/bloc/splash_event.dart';
import 'package:casino_test/features/splash_screen/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(
        connectionService: ConnectionService.instance,
      )..add(InitializeAppEvent()),
      child: Scaffold(
        body: SafeArea(bottom: false, child: SplashView()),
      ),
    );
  }
}
