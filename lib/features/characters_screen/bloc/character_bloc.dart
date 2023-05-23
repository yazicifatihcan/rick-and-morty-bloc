import 'package:casino_test/app/enums/general_enum.dart';
import 'package:casino_test/core/i10n/i10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/character_response_model.dart';
import '../repository/characters_repository.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharactersRepository charactersRepository;
  int currentPage = 1;

  CharacterBloc({required this.charactersRepository}) : super(InitialMainPageState()) {
    on<GetCharacterDataEvent>(_getDataOnMainPageCasino);
    on<FetchNextDataEvent>(_fetchNextData);
  }

  Future<void> _getDataOnMainPageCasino(
    GetCharacterDataEvent event,
    Emitter<CharacterState> emit,
  ) async {
    emit(LoadingMainPageState());
    final response = await charactersRepository.getCharacters(currentPage);
    if (response.status == BaseModelStatus.Ok) {
      currentPage++;
      emit(SuccessfulMainPageState(
        characters: response.data!.results,
      ));
    } else {
      emit(UnSuccessfulMainPageState(response.message ?? AppLocalization.getLabels.defaultErrorMessage));
    }
  }

  Future<void> _fetchNextData(
    FetchNextDataEvent event,
    Emitter<CharacterState> emit,
  ) async {
    final currentState = state;
    List<Result>? newCharacters = [];

    if (currentState is SuccessfulMainPageState && currentState.isFetching!) return;

    if (currentState is SuccessfulMainPageState) {
      newCharacters = List<Result>.from(currentState.characters!);
    }

    emit(SuccessfulMainPageState(characters: List<Result>.from(newCharacters), isFetching: true));
    final response = await charactersRepository.getCharacters(currentPage);
    emit(SuccessfulMainPageState(characters: List<Result>.from(newCharacters), isFetching: false));
    if (response.status == BaseModelStatus.Ok) {
      currentPage++;
      newCharacters.addAll(response.data!.results!);
      emit(SuccessfulMainPageState(characters: List<Result>.from(newCharacters), isFetching: false));
    } else {
      // showToastMessage(message: response.message, isError: true);
      emit(
        SuccessfulMainPageState(characters: List<Result>.from(newCharacters), isFetching: false, message: response.message ?? AppLocalization.getLabels.defaultErrorMessage),
      );
    }
  }
}
