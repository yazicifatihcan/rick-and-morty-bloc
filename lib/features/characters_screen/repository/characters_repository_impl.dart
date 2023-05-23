import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:casino_test/app/constants/http_status_codes.dart';
import 'package:casino_test/app/constants/http_urls.dart';
import 'package:casino_test/app/enums/general_enum.dart';
import 'package:casino_test/app/models/general/network/base_http_model.dart';
import 'package:casino_test/core/exception/http_error_exception.dart';
import 'package:casino_test/core/services/http_client.dart';
import 'package:casino_test/features/characters_screen/repository/characters_repository.dart';
import 'package:casino_test/features/characters_screen/models/character_response_model.dart';

import '../../../app/models/general/network/error_model.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  @override
  Future<BaseHttpModel<CharacterResponseModel?>> getCharacters(
    int page,
  ) async {
    try {
      final response = await HttpClient().request(
        HttpMethod.get,
        HttpUrl.getCharacters,
        headerParam: {},
        bodyParam: {
          'page': page.toString(),
        },
      );

      if (response!.statusCode == HttpStatus.ok) {
        final responseModel = CharacterResponseModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return BaseHttpModel(status: BaseModelStatus.Ok, data: responseModel);
      } else if (response.statusCode == HttpStatus.notFound) {
        final ErrorModel responseModel = ErrorModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return BaseHttpModel(status: BaseModelStatus.NotFound, message: responseModel.error);
      } else {
        final ErrorModel responseModel = ErrorModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return BaseHttpModel(status: BaseModelStatus.Error, message: responseModel.error);
      }
    } on AppException catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error, message: e.toString());
    } catch (e) {
      log(e.toString(), name: 'Api Error [GET]: getCharacters');
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }
}
