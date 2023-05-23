import 'package:casino_test/features/characters_screen/models/character_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class CharacterState extends Equatable {}

class InitialMainPageState extends CharacterState {
  @override
  List<Object> get props => [];
}

class LoadingMainPageState extends CharacterState {
  @override
  List<Object> get props => [];
}

class UnSuccessfulMainPageState extends CharacterState {
  final String message;

  UnSuccessfulMainPageState(this.message);
  @override
  List<Object> get props => [message];
}



class SuccessfulMainPageState extends CharacterState {
  final List<Result>? characters;
  final bool? isFetching;
  final String? message;

  SuccessfulMainPageState({this.characters,this.message,this.isFetching=false});

  @override
  List<Object> get props => [characters!,isFetching!,message ?? ''];
}
