import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {}

class InitialSplashPageState extends SplashState {
  @override
  List<Object> get props => [];
}

class LoadingSplashPageState extends SplashState {
  @override
  List<Object> get props => [];
}

class SuccessfulSplashPageState extends SplashState {
  @override
  List<Object> get props => [];
}

class InitializingErrorSplashPageState extends SplashState {
  final String? message;
  InitializingErrorSplashPageState({this.message});
  
  @override
  List<Object> get props => [message ?? ''];
}
