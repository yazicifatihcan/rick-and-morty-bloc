import 'package:casino_test/app/components/other/general_error_screen.dart';
import 'package:casino_test/app/extensions/widget_scale_extension.dart';
import 'package:casino_test/features/splash_screen/bloc/splash_bloc.dart';
import 'package:casino_test/features/splash_screen/bloc/splash_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/constants/assets.dart';
import '../../../app/constants/padding_and_radius.dart';
import '../bloc/splash_state.dart';

part 'components/loading_widget.dart';

class SplashView extends StatelessWidget {
  const SplashView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InitialSplashPageState || state is LoadingSplashPageState) {
          return _LoadingWidget();
        } else if (state is InitializingErrorSplashPageState) {
          return GeneralErrorScreen(
            onTapBtn: () => BlocProvider.of<SplashBloc>(context)
              ..add(
                InitializeAppEvent(),
              ),
            message: state.message,
          );
        } else {
          return GeneralErrorScreen(
            onTapBtn: () => BlocProvider.of<SplashBloc>(context)
              ..add(
                InitializeAppEvent(),
              ),
          );
        }
      },
    );
  }
}
