import 'package:casino_test/app/models/general/network/base_http_model.dart';
import 'package:casino_test/features/characters_screen/models/character_response_model.dart';

abstract class CharactersRepository {
  Future<BaseHttpModel<CharacterResponseModel?>> getCharacters(int page);
}
