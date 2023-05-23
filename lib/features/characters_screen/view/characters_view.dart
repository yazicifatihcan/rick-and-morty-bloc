import 'package:casino_test/app/components/message/toast_message.dart';
import 'package:casino_test/app/components/other/general_error_screen.dart';
import 'package:casino_test/app/constants/assets.dart';
import 'package:casino_test/app/constants/padding_and_radius.dart';
import 'package:casino_test/app/extensions/string_extension.dart';
import 'package:casino_test/app/extensions/widget_extension.dart';
import 'package:casino_test/app/extensions/widget_scale_extension.dart';
import 'package:casino_test/app/navigation/route_factory.dart';
import 'package:casino_test/core/i10n/i10n.dart';
import 'package:casino_test/features/characters_screen/models/character_response_model.dart';
import 'package:casino_test/features/characters_screen/bloc/character_bloc.dart';
import 'package:casino_test/features/characters_screen/bloc/character_event.dart';
import 'package:casino_test/features/characters_screen/bloc/character_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/theme/text_style/text_style.dart';

part "./components/general_text_field_for_character_info.dart";
part 'components/character_widget.dart';
part "succesfull_widget.dart";

@immutable
class CharactersView extends StatefulWidget {
  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if ((_scrollController.position.maxScrollExtent == _scrollController.position.pixels)) {
        BlocProvider.of<CharacterBloc>(context)..add(FetchNextDataEvent());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharacterBloc, CharacterState>(
      listener: (context, state) {
        if (state is SuccessfulMainPageState && state.message != null && state.message!.isNotEmpty) {
          showToastMessage(message: state.message, isError: true);
        }
      },
      builder: (blocContext, state) {
        if (state is LoadingMainPageState || state is InitialMainPageState) {
          return Center(
            child: const CircularProgressIndicator.adaptive(),
          );
        } else if (state is SuccessfulMainPageState) {
          return SuccesfullWidget(characters: state.characters ?? [], isFetching: state.isFetching!, scrollController: _scrollController);
        } else {
          return GeneralErrorScreen(
            onTapBtn: () => BlocProvider.of<CharacterBloc>(context)
              ..add(
                GetCharacterDataEvent(),
              ),
            message: (state as UnSuccessfulMainPageState).message,
            imagePath: pickleRickImage,
          );
        }
      },
    );
  }
}
