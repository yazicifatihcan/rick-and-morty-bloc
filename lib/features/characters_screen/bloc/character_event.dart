import 'package:casino_test/features/characters_screen/models/character_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object?> get props => [];
}

class GetCharacterDataEvent extends CharacterEvent {
  @override
  List<Object?> get props => [];
}

class FetchNextDataEvent extends CharacterEvent {
  @override
  List<Object?> get props => [];
}

class LoadingDataOnMainPageEvent extends CharacterEvent {
  const LoadingDataOnMainPageEvent();

  @override
  List<Object?> get props => [];
}

class DataLoadedOnMainPageEvent extends CharacterEvent {
  final CharacterResponseModel? characters;

  const DataLoadedOnMainPageEvent(this.characters);

  @override
  List<Object?> get props => [characters];
}
