import 'package:casino_test/features/characters_screen/repository/characters_repository_impl.dart';
import 'package:casino_test/features/characters_screen/view/characters_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/character_bloc.dart';
import 'bloc/character_event.dart';

class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterBloc(
        charactersRepository: CharactersRepositoryImpl(),
      )..add(GetCharacterDataEvent()),
      child: Scaffold(
        body: SafeArea(bottom: false, child: CharactersView()),
      ),
    );
  }
}
